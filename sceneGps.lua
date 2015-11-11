---------------------------------------------------------------------------------
--
-- scene1.lua
--
---------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
-- Called when the scene's view does not exist:
function scene:create( event )
	local sceneGroup = self.view
	
	for i = 1,math.floor(_H/5) do
      local titleBar = display.newLine( 0, i, _W*2, i )
       titleBar:setStrokeColor( 0.6-i/400, 0.7-i/400, 0.8-i/400 )
       sceneGroup:insert( titleBar )
    end
--------------

local function back( event )
   composer.gotoScene( backButton, "slideRight", 400 )
   composer.removeScene( "sceneGps" )
 
end

backB = widget.newButton
{
  x=_W/8,
  y=_H/10,
  defaultFile = "Buttons/back.png",
  overFile = "Buttons/backOver.png",
  onPress = back,
}
backB:scale( 2, 2 )
sceneGroup:insert( backB )
---------------------- Map
--[[  local shadow = display.newRect( _W/10, _H/2, _W/.55, _H/1.6 )
  shadow.anchorX = 0.0		-- TopLeft anchor
  shadow.anchorY = 0.0		-- TopLeft anchor
  shadow:setFillColor( 0, 0, 0, 120/255 )
   sceneGroup:insert( shadow )
  ----

 local myMap = native.newMapView( _W/10, _H/2, _W/.55, _H/1.6 )
  if myMap then
   myMap.anchorX = 0.0		-- TopLeft anchor
  myMap.anchorY = 0.0	

  sceneGroup:insert( myMap )
 
	-- Display a normal map with vector drawings of the streets.
	-- Other mapType options are "satellite" and "hybrid".
	myMap.mapType = "normal"
	-- The MapView is just another Corona display object and can be moved, resized, etc.

  end
  if myMap then
 	currentLocation = myMap:getUserLocation()
 	  currentLatitude = tonumber(currentLocation.latitude)
	  currentLongitude = tonumber(currentLocation.longitude)
  end
 	  local function showMap( event )
	     mapcentre = myMap:getUserLocation()
		currentLatitude = mapcentre.latitude
		currentLongitude = mapcentre.longitude
		myMap:setRegion( currentLatitude, currentLongitude, 0.01, 0.01, true )

 	   if mapcentre.errorCode then
		native.showAlert( "Map not available", mapcentre.errorMessage, { "OK" } )
	     else
	  	 -- Current location data was received.
		 -- Move map so that current location is at the center.

		 myMap:setRegion( currentLatitude, currentLongitude, 0.01, 0.01, true )
	     myMap:setCenter( currentLatitude, currentLongitude, true )
	     end
	  end

 --- end of Map ]]--
 -------text
local yP = display.newImageRect( "images/book.jpg", _W*2, _H*1.4 )
yP.x = _W
yP.y = _H
  sceneGroup:insert( yP )
  --
local function mapPressed( event )

		--local alert = native.showAlert( "Feature", "This feature may currently not work on iPhone", { "Yes" } )

		local temp = string.gsub(addressSearch[numberClicked], " ", "+" )

     -- local didOpenGoogleMaps  =
      --system.openURL("comgooglemaps://?q="..temp)
      system.openURL("http://maps.google.com/?q="..temp)
      --system.openURL("comgooglemaps://?q=pizza&center=40.765819,-73.975866")
      	--if ( didOpenGoogleMaps == false ) then  --defer to Apple Maps
      --system.openURL("http://maps.apple.com/?q="..temp)
    --end

end

mapB = widget.newButton
{
  x=_W*1.7,
  y=_H*.85,
  defaultFile = "images/drive.jpg",
  overFile = "Buttons/backOver.png",
  onPress = mapPressed,
}
mapB:scale( .2,.2)
sceneGroup:insert( mapB )
---
print(addressSearch[numberClicked])
   local busName = display.newText( nameSearch[numberClicked] , _W, _H*.6,_W*1.5,_H/2, nil,  _W*.12 )
    busName:setFillColor( 0,0,1)
      sceneGroup:insert( busName )
         local addressT = display.newText( addressSearch[numberClicked] , _W*1.1, _H*.9,_W*1.5,_H/2, nil,  _W*.09 )
    addressT:setFillColor( 0 )
      sceneGroup:insert( addressT )
           phoneT = display.newText( "tel:"..phoneSearch[numberClicked] , _W*1.15, _H*1.15, _W*1.6, _H/2, nil,  _W*.12 )
    phoneT:setFillColor( 0,0,1 )
      sceneGroup:insert( phoneT )
           emailT = display.newText(emailSearch[numberClicked] , _W*1.15, _H*1.35, _W*1.6, _H/2, nil,  _W*.08 )
    emailT:setFillColor( 0,0,1 )
      sceneGroup:insert( emailT )
            webT = display.newText(webSearch[numberClicked] , _W*1.15, _H*1.45, _W*1.6, _H/2, nil,  _W*.07 )
    webT:setFillColor( 0,0,1 )
      sceneGroup:insert( webT )
--- text Taps

local function phoneTapped( event )
	local function onComplete( event )
   if event.action == "clicked" then
        local i = event.index
        if i == 1 then
        		local temp1 = string.gsub(phoneT.text, " ", "" )
        		print(temp1)
            system.openURL( temp1)
        elseif i == 2 then
        
        end
    end
  end

	local alert = native.showAlert( "Call برقراری تماس", "Call the number تماس برقرار شود؟", { "Yes", "No" }, onComplete )
end

phoneT:addEventListener( "tap", phoneTapped ) 
local function webTapped( event )
	 system.openURL( webT.text )
end 
webT:addEventListener( "tap", webTapped ) 
--
local function emailTapped( event )
  system.openURL( "mailto:"..emailT.text )
end
emailT:addEventListener( "tap", emailTapped ) 
--


--------------- end of text

end -- End of scene create

function scene:show( event )
	
	local phase = event.phase
	
	if "did" == phase then
	
		-- remove previous scene's view
		--composer.removeScene( "scene4" )
	
			--image:addEventListener( "touch", image )
	
	end
	
end

function scene:hide( event )
	
	local phase = event.phase
	
	if "will" == phase then
	
		--print( "1: hide event, phase will" )
	
		-- remove touch listener for image
		--image:removeEventListener( "touch", image )
	
	
	end
	
end

function scene:destroy( event )
	 print( "((destroying scene 1's view))" )
end

---------------------------------------------------------------------------------



local locationHandler1 = function( event )

local longitude = display.newText( "000.000000", 0, 0, "DBLCDTempBlack", 8 )
longitude.x, longitude.y = -_W/5, 10

	-- Check for error (user may have turned off Location Services)
	if event.errorCode then
		native.showAlert( "GPS Location Error", event.errorMessage, {"OK"} )
		print( "Location error: " .. tostring( event.errorMessage ) )
	else

		local longitudeText = string.format( '%.5f', event.longitude )
		currentLongitude = longitudeText
		longitude.text = longitudeText

	end
end


-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
Runtime:addEventListener( "location", locationHandler1 )
--Runtime:addEventListener( "heading", directionHandler1 )



---------------------------------------------------------------------------------

return scene