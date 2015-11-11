---------------------------------------------------------------------------------
--
-- scene1.lua
--
---------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )
        local json = require "json"
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

     searchLat = 0
      searchLong = 0
  native.showAlert( "راهنما", 'بعد از ظاهر شدن نقشه دکمه " روی نقش نشان بده" (بالا سمت راست) را فشار دهید تا بیزینس‌ها رو نقش نشان داده شوند.\nبا لمس علامتهای قرمز روی نقشه اسم بیزینس را مشاهده فرمایید.', { "OK" } )
-- Touch event listener for background image
local function onSceneTouch( self, event )
	if event.phase == "began" then
		
		composer.gotoScene( "scene1", "slideRight", 800  )
		
		return true
	end
end


-- Called when the scene's view does not exist:
function scene:create( event )
      backButton = "sceneAround"
	local sceneGroup = self.view


	--image.touch = onSceneTouch
	for i = 1,math.floor(_H/5) do
      local titleBar = display.newLine( 0, i, _W*2, i )
       titleBar:setStrokeColor( 0.6-i/400, 0.7-i/400, 0.8-i/400 )
       sceneGroup:insert( titleBar )
    end

    local title = display.newText( "Businesses \nAround you", _W*1.15, _H*.57,_W*1.8,_H, systemFontBold, _W*.08 )
      title:setFillColor( 0,0,1 )
      sceneGroup:insert( title )
          local title = display.newText( "بیزینس‌های \nاطراف", _W*1.7, _H*.57,_W*1.8,_H, systemFontBold, _W*.08 )
      title:setFillColor( 0,0,1 )
      sceneGroup:insert( title )

  
--------------

local function back( event )
   composer.gotoScene( "sceneMain", "slideRight", 400 )
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
--------------------
 local function teeRowRender( event )
     -- Get reference to the row group
    local row = event.row

    -- Cache the row "contentWidth" and "contentHeight" because the row bounds can change as children objects are added
    local rowHeight = row.contentHeight
    local rowWidth = row.contentWidth

     local jobText = display.newText( row, row.id, 0, 0, systemFontBold, 25 )
    jobText:setFillColor( 0,0,0 )
    jobText.anchorX = 0
    jobText.x = _W*.15
    jobText.y = rowHeight * 0.55

  -- Precalculate y position. NOTE: row's height will change as we add children
  local rowArrow = display.newImage( row, "Buttons/rowArrow.png", false )
  -- Right-align the arrow
  rowArrow.anchorX = 1
  rowArrow.x = rowWidth - _W/6
  rowArrow.y = rowHeight*.5
 end
 singleListData=""
 local function jobList( event )
    local row = event.row
  singleListData = row.id
  numberClicked = row.index
    composer.gotoScene( "sceneGps", "slideUp", 400 )

end
 ---
 teeList = widget.newTableView
 {
    left = .1*_W,
    top = _H*1.1,
    height = _H*.8,
    width = _W*1.8,
    onRowRender = teeRowRender,
    onRowTouch = jobList,
    listener = scrollListener,
    scrollBarOptions = {
        sheet = scrollBarSheet,
        topFrame = 1,
        middleFrame = 2,
        bottomFrame = 3
    }
  }
 sceneGroup:insert( teeList )
 -------------------
local function busArounds1( event )
if not event.error then
         nameSearch ={}
         phoneSearch ={}
         emailSearch ={}
         addressSearch ={}
         webSearch ={}
         postcodeSearch ={}
         suburbSearch ={}
         latSearch= {}
         longSearch={}
        for i=1,#event.response.result do
              teeList:insertRow{
                 id = event.response.result[i].content.." "..event.response.result[i].suburb, 
                   rowHeight = _H/5,
                   isCategory = false,
                                      }
         nameSearch[i]=event.response.result[i].content
         phoneSearch[i]=event.response.result[i].phone
         emailSearch[i]=event.response.result[i].email
         addressSearch[i]=event.response.result[i].address
         webSearch[i]=event.response.result[i].web
         postcodeSearch[i]=event.response.result[i].postcode
         suburbSearch[i]=event.response.result[i].suburb
         latSearch[i]=event.response.result[i].coord.latitude
         longSearch[i]=event.response.result[i].coord.longitude
         
        markerTitle = nameSearch[i]
        myMap:addMarker( latSearch[i], longSearch[i], { title=markerTitle, markerTitle } )
 
       end 
   else
      local alert = native.showAlert(  "Network Error", "Please check your internet connection!", { "Ok"} )

   end
end 
---------------------- Map
  local shadow = display.newRect( _W/10, _H/4, _W*1.8, _H/1.2 )
  shadow.anchorX = 0.0    -- TopLeft anchor
  shadow.anchorY = 0.0    -- TopLeft anchor
  shadow:setFillColor( 1, 0, 0, 120/255 )
   sceneGroup:insert( shadow )
  ----

   myMap = native.newMapView( _W/10, _H/4, _W*1.8, _H/1.2 )
  if myMap then
   myMap.anchorX = 0.0    -- TopLeft anchor
  myMap.anchorY = 0.0 
    myMap.mapType = "normal"
  sceneGroup:insert( myMap )
end
 local function listOnMap( event )
      mapcentre = myMap:getUserLocation()
    currentLatitude = mapcentre.latitude
    currentLongitude = mapcentre.longitude
    myMap:setRegion( currentLatitude, currentLongitude, 0.1, 0.1, true )

     if mapcentre.errorCode then
    native.showAlert( "Error", mapcentre.errorMessage, { "OK" } )
       else
       -- Current location data was received.
     -- Move map so that current location is at the center.

     myMap:setRegion( currentLatitude, currentLongitude, 0.1, 0.1, true )
       myMap:setCenter( currentLatitude, currentLongitude, true )
   end
        --[[local options = { 
            title = "Displayed Title", 
            subtitle = "Subtitle text", 
            listener = markerListener,
           imageFile =  "back.png"}]]--
         
        --myMap:addMarker( latSearch[i], longSearch[i] )

     local message1 = {}
            message1["geoPoint"] = {
            ["__type"]= "GeoPoint",
            ["latitude"]= currentLatitude,
            ["longitude"]= currentLongitude
        }
  parse:run( "InfectionCheck_BETA", message1, busArounds1 )
 
end
-- Search All
local mapB = widget.newButton
{
  x = _W*1.5,
  y = _H*0.1,
      width = _W*.65,
    height = _H/7,
    label = "Show on Map\nروی نقش نشان بده",
    onPress = listOnMap,
    emboss = false,
  defaultFile = "Buttons/Button.png",
  overFile = "Buttons/ButtonOver.png",
    labelAlign="center",
    fontSize=20
}
  sceneGroup:insert( mapB )
--
  --  local title1 = display.newText( "Show on Map\nروی نقش نشان بده", _W*2.18, _H*.55,_W*1.8,_H, systemFontBold, _W*.07)
    --  title1:setFillColor( 0,0,1 )
     -- sceneGroup:insert( title1 )
    
 --- end of Map
 --------------

end -- End of scene create

function scene:show( event )
	
	local phase = event.phase
	
	if "did" == phase then
	
		-- remove previous scene's view
		composer.removeScene( "scene4" )
	
			--image:addEventListener( "touch", image )
	
	end
	
end

function scene:hide( event )
	
	local phase = event.phase
	
	if "will" == phase then
	
		print( "1: hide event, phase will" )
	
		-- remove touch listener for image
		--image:removeEventListener( "touch", image )
	
	
	end
	
end

function scene:destroy( event )
	print( "((destroying scene 1's view))" )
end

---------------------------------------------------------------------------------
local locationHandler1 = function( event )

	if event.errorCode then
		native.showAlert( "GPS Location Error", event.errorMessage, {"OK"} )
	else

      searchLat = event.latitude
      searchLong = event.longitude
 
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