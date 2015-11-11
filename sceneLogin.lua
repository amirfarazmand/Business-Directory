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
 --Available Tees
  
------------------------------------------------
local function saveUser()
  --register in parse and a file
           local function onCreateUser( event )
              if not event.error then
                 local alert = native.showAlert( "Save", "You are saved with ID "..event.response.objectId, { "Ok"} )
                 local filePath2 = system.pathForFile( "register.txt", system.DocumentsDirectory )
                  file2 = io.open( filePath2, "w" )
                  file2:write( userName.text )
                  userEmailRow.text = userName.text 
                     io.close( file2 )
                     registerUserB.isVisible=false
                     userName.isVisible=false
                     else
                   local alert = native.showAlert( "Save", "Phone number or Username taken or not entered!", { "Ok" } )
              end
           end
 local userDataTable = { ["username"] = userName.text, ["password"] = system.getInfo( "deviceID" ),["email"] = system.getInfo( "deviceID" ).."@chapar.com" }
 parse:createUser( userDataTable, onCreateUser )
 --end register in parse
end
----
  local userNameBox = native.newTextField( _W, _H*.35, _W, _H/8)
   sceneGroup:insert( userNameBox)
    local userText = display.newText( "Name", _W*.25, _H*.35, native.systemFont, _H/15)
     sceneGroup:insert( userText)
    local emailBox = native.newTextField( _W, _H*.55, _W, _H/8)
     sceneGroup:insert( emailBox)
        local emailText = display.newText( "Email", _W*.25, _H*.55, native.systemFont, _H/15)
         sceneGroup:insert( emailText)
      local phoneBox = native.newTextField( _W, _H*.75, _W, _H/8)
       sceneGroup:insert( phoneBox)
          local phoneText = display.newText( "Phone", _W*.25, _H*.75, native.systemFont, _H/15)
           sceneGroup:insert( phoneText)
local function saveUser()
  --register in parse and a file
           local function onCreateUser( event )
              if not event.error then
                 local alert = native.showAlert( "Save", event.response.objectId, { "Ok"} )
                 local filePath2 = system.pathForFile( "register.txt", system.DocumentsDirectory )
                  file2 = io.open( filePath2, "w" )
                  file2:write( userNameBox.text )
                     io.close( file2 )
                     registerUserB.isVisible=false
                     userName.isVisible=false
                     ini()
                     else
                   local alert = native.showAlert( "Save", "Phone number or Username taken or not entered!", { "Ok" } )
              end
           end
 local userDataTable = { ["username"] = emailBox.text, ["password"] = phoneBox.text, ["phone"] = phoneBox.text}
 parse:createUser( userDataTable, onCreateUser )
 --end register in parse
end
---


   registerUserB = widget.newButton
{
    x=_W,
    y=_H*1.05,
    width = _W,
    height = _H/9,
    label = "Register",
    labelColor = { default={ 1, 1, 1 }, over={ 0, 1, 1 } },
    onPress = saveUser,
    emboss = false,
    --defaultFile = "mana.png",
    --overFile = "manaOver.png",
    shape="roundedRect",
    cornerRadius = 8,
    fillColor = { default={ 0.35, 0.35, 0.75, 1 }, over={ 1, 0.1, 0.7, 0.4 } },
    strokeColor = { default={ 0.55, 0.45, 0.55, 1 }, over={ 0.8, 0.8, 1, 1 } },
    strokeWidth = 3,
    fontSize=_W/10
}
 sceneGroup:insert( registerUserB)

--------------------------------

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
	
		print( "1: hide event, phase will" )
	
		-- remove touch listener for image
		--image:removeEventListener( "touch", image )
	
	
	end
	
end

function scene:destroy( event )
	print( "((destroying scene 1's view))" )
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

---------------------------------------------------------------------------------

return scene