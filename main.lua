--
-- Abstract: Composer Sample
--
-- Version: 1.0
-- 
-- Sample code is MIT licensed, see http://www.coronalabs.com/links/code/license
-- Copyright (C) 2011 Corona Labs Inc. All Rights Reserved.
--
-- Demonstrates use of the Composer API (scene events, transitioning, etc.)
--
-- Supports Graphics 2.0
------------------------------------------------------------

-- hide device status bar
--display.setStatusBar( display.HiddenStatusBar )

-- requireed controller module
local composer = require "composer"
local storyboard = require( "storyboard" )
local widget = require "widget"
 parse = require( "mod_parse" )

--Initialsing parse.com API
 parse:init( { appId = "4Y8gqAUpVrLqS2rhXFzewRJKdwDSzT0ocztXaD4Y", apiKey = "62T4FyyhGuSYZ5wjCwYN5h3Oe4bAO4Ec35sS9l6m" } ) -- business Drectory
parse.showStatus = false -- outputs response info in the console
parse.showAlert = false -- show a native pop-up with error and result codes
parse.showJSON = false -- output the raw JSON response in the console
------------- Push notification
function DidReceiveRemoteNotification(message, additionalData, isActive)
    print("DidReceiveRemoteNotification:Messsage: " .. message)
    if (additionalData) then
        if (additionalData.discount) then
            native.showAlert( "Discount!", message, { "OK" } )
            -- Take player to your game store
        elseif(additionalData.bonusCredits) then
            native.showAlert( "Bonus Credits!", message, { "OK" } )
            -- Add credits and take player your game store or inventory if you like
        elseif(additionalData.actionSelected) then -- Interactive notification button pressed
            native.showAlert("Button Pressed!", "ButtonID:" .. additionalData.actionSelected, { "OK"} )
        end
    end
end

-- Initilising the push notification
local GameThrive = require("plugin.GameThrivePushNotifications")
GameThrive.Init("a54f7e3c-e327-11e4-8475-bfb79938dc80", 819198044608, DidReceiveRemoteNotification)
GameThrive.TagPlayer("CoronaTag1", "value1")
--
_W= display.contentCenterX
_H= display.contentCenterY*1


--Showing the entry pictures and moving to main view
picNum = math.floor((math.random()*10))
if picNum > 7 then picNum = 1 end
if picNum < 1 then picNum = 1 end
print (picNum)
golfer = display.newImage( "images/"..picNum..".jpg",display.contentCenterX,display.contentCenterY)
local function repeatFade (event)
    golfer.alpha = 1
    transition.to( golfer, { alpha=0, time=700 } )
      composer.gotoScene( "sceneMain", "zoomOutIn", 400 )
end
timer.performWithDelay(2000, repeatFade, 1 )