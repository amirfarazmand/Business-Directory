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
      titleBar:setStrokeColor( 1-i/400, 1-i/400, 0 )
       sceneGroup:insert( titleBar )
    end
	--------------
	--[[local day = os.date("%d")
	local month = os.date("%m")
	local year = os.date("%Y")]]
	local teeDate = display.newText( "Search Results  نتیجه جستجو", 0, 0, native.systemFontBold,  _W*.08 )
	teeDate:setFillColor( 0,0,1 )
	teeDate.x, teeDate.y = _W*1.15 , _H/9
	sceneGroup:insert( teeDate )
	dayTemp=tonumber(string.sub(os.date(),0,-16))
	----
 local function back( event )
   composer.gotoScene( backButton, "slideRight", 400 )
    composer.removeScene( "searchList" )
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
 ------------------------
  local function teeRowRender( event )
     -- Get reference to the row group
    local row = event.row

    -- Cache the row "contentWidth" and "contentHeight" because the row bounds can change as children objects are added
    local rowHeight = row.contentHeight
    local rowWidth = row.contentWidth

     if jobText then jobText =nil end
     local jobText = display.newText( row, row.id, 0, 0, systemFontBold, _W*.08 )
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
 local function singleDetails( event )
    local row = event.row
  numberClicked = row.index
    composer.gotoScene( "sceneGps", "slideUp", 400 )
     composer.removeScene( "searchList", "slideUp", 400 )

end
 ---
 teeList = widget.newTableView
 {
    left = 0,
    top = _H/4,
    height = _H*1.7,
    width = _W*2,
    onRowRender = teeRowRender,
    onRowTouch = singleDetails,
    listener = scrollListener,
    scrollBarOptions = {
        sheet = scrollBarSheet,
        topFrame = 1,
        middleFrame = 2,
        bottomFrame = 3
    }
  }
 sceneGroup:insert( teeList )
 ---
--Start Search 
local function queryallJobsResults( event )
  if not event.error then
    if #event.results == 0 then 
        local alert = native.showAlert(  "No results", "No business found! If you know similar bisunesses, please meail their details to us at info@jorc.com.au\n هیچ بیزینسی با این عنوان پیدا نشد، اگر شما بیزینسی در این زمینه می‌شناسید لطفا مشخصات آن را به ما ایمیل کنید.\n info@jorc.com.au", { "Ok"} )
     else
         nameSearch = nil 
         phoneSearch = nil 
         emailSearch = nil 
         addressSearch = nil 
         webSearch = nil 
         postcodeSearch = nil 
         suburbSearch = nil 

         nameSearch ={}
         phoneSearch ={}
         emailSearch ={}
         addressSearch ={}
         webSearch ={}
         postcodeSearch ={}
         suburbSearch ={}
        for i=1,#event.results do
              teeList:insertRow{
                 id = event.results[i].content.." "..event.results[i].suburb, 
                   rowHeight = _H/5,
                   isCategory = false,
                                      }
         nameSearch[i]=event.results[i].content
         phoneSearch[i]=event.results[i].phone
         emailSearch[i]=event.results[i].email
         addressSearch[i]=event.results[i].address
         webSearch[i]=event.results[i].web
         postcodeSearch[i]=event.results[i].postcode
         suburbSearch[i]=event.results[i].suburb
         --network.download( carPhotoSearch[i],"GET", getPhotos, i..".png", system.TemporaryDirectory )
       end 
     end
   else
      local alert = native.showAlert(  "Network Error", "Please check your internet connection!", { "Ok"} )

   end

end

 local queryallJobsTable = { ["where"] = 
                                { ["job"] = searchItem } }
                                 --["phone"] = "1"}  }
 parse:getObjects( "allJobs", queryallJobsTable, queryallJobsResults )
--End Search


end -- end of scene:create( event )
---------------
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
	
		--print( "1: hide event, phase will" )
	
		-- remove touch listener for image
		--image:removeEventListener( "touch", image )
	
	
	end
	
end

function scene:destroy( event )
	--print( "((destroying scene 1's view))" )
end
---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
---------------------------------------------------------------------------------
return scene

