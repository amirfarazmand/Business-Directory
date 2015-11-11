local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
-- Called when the scene's view does not exist:
function scene:create( event )
  backButton = "sceneallJobs"
   allJobs={"Building","Bank and Finanacial", "Beauty", "Car", "Furniture", "Food",  "Insurance", "Legal", "Medical","Mechanic", "Repairer", "Travel",
         "Photoshop", "Events", "Teacher", "Consultant", "Jewellery",  "Gallery/Exhibition", "Translation", "Traditional", "Advertisement", "Miscellaneous"}
 allJobsTran={["Building"]="ساختمان", ["Bank and Finanacial"]="مالی و بانکی", ["Beauty"]= "آرایش گری",  ["Furniture"]= "وسیله منزل", ["Food"]="غذا" ,  ["Insurance"]="بیمه" ,  ["Legal"]="وکیل" , ["Medical"]="پزشک دکتر", ["Mechanic"]="مکانیک", ["Travel"]="مسافرت",
           ["Repairer"]="تعمیر کار", ["Jewellery"]="جواهرات", ["Events"] = "مراسم عروسی‌ و غیره", ["Photoshop"] = "عکاسی‌", ["Traditional"] = "سنتی", ["Teacher"] = "معلم", ["Advertisement"] = "آگهی‌ تبلیغات", ["Car"] = "ماشین", ["Consultant"] = "مشاور", ["Gallery/Exhibition"] = "نمایشگاه", ["Translation"] = "مترجم", ["Miscellaneous"] = "متفرقه" }
 

	local sceneGroup = self.view
	 
	for i = 1,math.floor(_H/5) do
      local titleBar = display.newLine( 0, i, _W*2, i )
      titleBar:setStrokeColor( 1-i/400, 1-i/400, 0 )
       sceneGroup:insert( titleBar )
    end
	--------------
	--[[local day = os.date("%d")
	local month = os.date("%m")
	local year = os.date("%Y")]]--
	local teeDate = display.newText( "Select Type of Business\nنوع بیزینس را انتخاب کنید", 0, 0, native.systemFontBold, _W*.08 )
	teeDate:setFillColor( 0,0,1 )
	teeDate.x, teeDate.y = _W*1.35 , _H*.12
	sceneGroup:insert( teeDate )
	dayTemp=tonumber(string.sub(os.date(),0,-16))
	----
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
 ------------------------
  local function teeRowRender( event )
     -- Get reference to the row group
    local row = event.row

    -- Cache the row "contentWidth" and "contentHeight" because the row bounds can change as children objects are added
    local rowHeight = row.contentHeight
    local rowWidth = row.contentWidth

     local jobText = display.newText( row, row.id.."  "..allJobsTran[row.id], 0, 0, systemFontBold, _W*.09 )
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
    if row.id ~= "Miscellaneous" then 
      singleListData = row.id
      composer.gotoScene( "singleList", "slideUp", 400 )
      composer.removeScene( "sceneallJobs" )
      else
      searchItem = "Miscellaneous"
      composer.gotoScene( "searchList", "slideUp", 400 )
    end

end
 ---
 teeList = widget.newTableView
 {
    left = 0,
    top = _H/4,
    height = _H*1.7,
    width = _W*2,
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
 ---
for i=1,#allJobs do
    teeList:insertRow{
   id = allJobs[i], 
     rowHeight = _H/6,
     isCategory = false,
  }
 end 

end -- end of scene:create( event )
---------------
function scene:show( event )
	backButton = "sceneallJobs"
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