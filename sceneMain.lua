local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- Called when the scene's view does not exist:
function scene:create( event )
  backButton = "sceneMain"
  local sceneGroup = self.view
-------------------------------------------
 local head=display.newRect(_W,_H*.1,_W*2.5,_H*.4)
 head:setFillColor( 1,1,0)
  sceneGroup:insert( head )
 local body=display.newRect(_W,_H*1.3,_W*2.5,_H*2)
 body:setFillColor( 1,1,1)
  sceneGroup:insert( body )
  --
local yP = display.newImageRect( "images/logo.jpg", _W*.30, _W*.30 )
yP.x = _W*.25
yP.y = _H*.15
  sceneGroup:insert( yP )
---------------Data
local myRoundedRectTouch = display.newRoundedRect( _W*1.8,_H*.15, _W*.25 , _H*.12, 6 )
myRoundedRectTouch:setFillColor( 1,1,0 )
  sceneGroup:insert( myRoundedRectTouch )
  for i =1,3 do 
local myRoundedRect = display.newRoundedRect( _W*1.8,_H*(.1+(i-1)*.05), _W*.25 , _H*.02, 6 )
myRoundedRect:setFillColor( 0.1 )
  sceneGroup:insert( myRoundedRect )
end
---------------------------------------------
local function allPressed( event )
  if menuIs then  menu() end
 composer.gotoScene( "sceneallJobs", "slideUp", 400 )
end
-- Search All


local allB = widget.newButton
{
  x = _W,
  y = _H*0.15,
      width = _W*.9,
    height = _H/5,
    label = "",
    labelColor = { default={ 0, 0, 1 }, over={ 0, 0, 0, 0.5 } },
    onPress = allPressed,
    emboss = false,
  defaultFile = "Buttons/Button.png",
  overFile = "Buttons/ButtonOver.png",
    labelAlign="center",
    fontSize=_W*.1,
}
  sceneGroup:insert( allB )
  --
  title1 = display.newText( "تمامی‌ بیزینسها", _W, _H*.18, nil, _W/12 )
     title1:setFillColor( 0,0,1 )
      sceneGroup:insert( title1 )
        --
  title2 = display.newText( "All Businesses", _W, _H*.12, nil, _W/12 )
     title2:setFillColor( 0,0,1 )
      sceneGroup:insert( title2)
------
local function busRegister( event )
  if menuIs then  menu() end
 composer.gotoScene( "sceneRegister", "slideUp", 400 )
end
-- Search All
local busB = widget.newButton
{
  x = _W,
  y = _H*1.35,
      width = _W*.9,
    height = _H/5,
    label = "",
    labelColor = { default={ 0, 0, 1 }, over={ 0, 0, 0, 0.5 } },
    onPress = busRegister,
    emboss = false,
  defaultFile = "Buttons/Button.png",
  overFile = "Buttons/ButtonOver.png",
    labelAlign="center",
    fontSize=_W*.08,
}
  sceneGroup:insert( busB )
    --
  title3 = display.newText( "Register a Business", _W, _H*1.32, nil, _W/12 )
     title3:setFillColor( 0,0,1 )
      sceneGroup:insert( title3)
        --
  title4 = display.newText( " ثبت بیزینس جدید", _W, _H*1.38, nil, _W/12 )
     title4:setFillColor( 0,0,1 )
      sceneGroup:insert( title4)
------
local function resPressed( event )
  searchItem = "Restaurant"
  composer.gotoScene( "searchList", "slideUp", 400 )
end
local resB = widget.newButton
{
  x = _W*.5,
  y = _H*0.55,
      width = _W*.4,
    height = _H*.215,
    label = "",
    onPress = resPressed,
    emboss = false,
  defaultFile = "images/res.jpg",
  overFile = "images/resOn.jpg",
    labelAlign="center",
}
  sceneGroup:insert( resB )
------

 function docPressed( event )
  searchItem = "GP"
  composer.gotoScene( "searchList", "slideUp", 400 )
end
local docB = widget.newButton
{
  x = _W*1,
  y = _H*0.7,
      width = _W*.4,
    height = _H*.215,
    label = "",
    onPress = docPressed,
    emboss = false,
  defaultFile = "images/doc.jpg",
  overFile = "images/docOn.jpg",
    labelAlign="center",
    fontSize=36,
}
  sceneGroup:insert( docB )
------
local function hairPressed( event )
  searchItem = "HairdresserWoman"
  composer.gotoScene( "searchList", "slideUp", 400 )
end
local hairB = widget.newButton
{
  x = _W*1.5,
  y = _H*0.55,
      width = _W*.4,
    height = _H*.215,
    label = "",
    onPress = hairPressed,
    emboss = false,
  defaultFile = "images/hair.jpg",
  overFile = "images/hairOn.jpg",
    labelAlign="center",
    fontSize=36,
}
  sceneGroup:insert( hairB )
------
local function aroundPressed( event )
   composer.gotoScene( "sceneAround", "slideUp", 400 )
end
local denB = widget.newButton
{
  x = _W,
  y = _H*1,
      width = _W*.4,
    height = _H*.215,
    label = "",
    labelColor = { default={ 1, 0, 1 }, over={ 0, 0, 0, 0.5 } },
    onPress = aroundPressed,
    emboss = false,
  defaultFile = "images/map.png",
  overFile = "images/map.png",
    labelAlign="center",
    fontSize=20,
}
  sceneGroup:insert( denB )
      --
  title5 = display.newText( "Around me", _W, _H*1.02, nil, _W/15 )
     title5:setFillColor( 0,0,1 )
      sceneGroup:insert( title5)
        --
  title6 = display.newText( "دور و ور", _W, _H*1.06, nil, _W/12 )
     title6:setFillColor( 0,0,1 )
      sceneGroup:insert( title6)
------
local function buildPressed( event )
    searchItem = "Builder"
  composer.gotoScene( "searchList", "slideUp", 400 )
end
local buildB = widget.newButton
{
  x = _W*.5,
  y = _H*.85,
      width = _W*.4,
    height = _H*.215,
    label = "",
    onPress = buildPressed,
    emboss = false,
  defaultFile = "images/build.jpg",
  overFile = "images/buildOn.jpg",
    labelAlign="center",
    fontSize=36,
}
  sceneGroup:insert( buildB )
------
local function cafPressed( event )
    searchItem = "Cafe"
  composer.gotoScene( "searchList", "slideUp", 400 )
end
local cafB = widget.newButton
{
  x = _W*1.5,
  y = _H*.85,
      width = _W*.4,
    height = _H*.215,
    label = "",
    onPress = cafPressed,
    emboss = false,
  defaultFile = "images/cafe.png",
  overFile = "images/cafeOn.png",
    labelAlign="center",
    fontSize=36,
}
  sceneGroup:insert( cafB )
--------
---------------- Menu Objects
 --touch functions
 local function menuRowRender( event )
    -- Get reference to the row group
    local row = event.row

    -- Cache the row "contentWidth" and "contentHeight" because the row bounds can change as children objects are added
    local rowHeight = row.contentHeight
    local rowWidth = row.contentWidth
  
    if row.index == 1 then 
        userEmailRow = display.newText( row, userEmail, 0, 0, nil, _W/12 )
     userEmailRow:setFillColor( 0 )
    -- Align the label left and vertically centered
    userEmailRow.anchorX = 0
    userEmailRow.x = 20
    userEmailRow.y = rowHeight * 0.5
   else
    local rowTitle = display.newText( row, row.id, 0, 0, nil, _W/8 )
    rowTitle:setFillColor( 0 )
    -- Align the label left and vertically centered
    rowTitle.anchorX = 0
    rowTitle.x = 20
    rowTitle.y = rowHeight * 0.5
  end


  -- Precalculate y position. NOTE: row's height will change as we add children
  local rowArrow = display.newImage( row, "Buttons/rowArrow.png", false )
  -- Right-align the arrow
  rowArrow.anchorX = 1
  rowArrow.x = rowWidth - _W/6
  rowArrow.y = rowHeight*.5
end
 local function menuTouch( event )
      local row = event.row
  if row.index > 1 then 
     local alert = native.showAlert(  row.id, sideMenu[row.id], { "Ok"} )
   else
     if menuIs then menu() end
       if userEmail == "Register" then
          composer.gotoScene( "sceneLogin", "slideUp", 400 )
        else
           local alert = native.showAlert( "Registeration", "You are already registered", { "Ok"} )
       end
    
  end
 end

 menuList = widget.newTableView
 {
    left = _W*3,
    top = _H*.3,
    height = _H*1.6,
    width = _W*1.3,
    onRowRender = menuRowRender,
    onRowTouch = menuTouch,
    listener = scrollListener,
    scrollBarOptions = {
        sheet = scrollBarSheet,
        topFrame = 1,
        middleFrame = 2,
        bottomFrame = 3
    }
  }
    
 local function checkRegister( )
    local filePath1 = system.pathForFile( "register.txt", system.DocumentsDirectory )
      local file1 = io.open( filePath1, "r" )
          if file1 then 
            local contents = file1:read( "*a" )
            userEmail =  "Registered as ".. contents
             io.close( file1 )
           else
          userEmail =  "Register"
         end
 end
 checkRegister()

       sideMenu={[1] = "Login", [2] = "Help", [3]= "Legal", ["Help"]="Please contact 0413556955 or email at info@jorc.com.au for any complaint, problem and feedback",
        ["Legal"]="We have done our best effort to find suitable businesses for the Persian community. We have no responsibility in the businesses listed and their legitimacy"}

for i=1,3 do
    menuList:insertRow{
   id = sideMenu[i], 
     rowHeight = _H/5,
     isCategory = false,
     lineColor = {0.2}
  }
 end ---end of tableview
----
  local shade=display.newRect(-_W,_H*1.3,_W,_H*2)
 shade:setFillColor( 0.1)

 menuIs = false
function menu( event )
  if menuIs == false then 
   transition.to( menuList, { time=400, alpha=1, x=(_W*1.4), y=_H*1.1 } )
   transition.to( shade, { time=400, alpha=0.3, x=(_W*.25), y=_H*1.3 } )
      menuIs= true
  else
     transition.to( menuList, { time=400, alpha=1, x=(_W*3.05), y=_H*1.1 } )
     transition.to( shade, { time=400, alpha=1, x=(-_W), y=_H*1.3 } )
    menuIs=false
  end
end
myRoundedRectTouch:addEventListener( "tap", menu )
shade:addEventListener( "tap", menu)
-- end of Menu objects
end  -- of scene:create
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
