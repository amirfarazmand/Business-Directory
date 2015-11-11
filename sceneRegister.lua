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
local function textListener( event )

    if ( event.phase == "began" ) then

    elseif ( event.phase == "ended" or event.phase == "submitted" ) then
       native.setKeyboardFocus( nil )
    end
end
----
local function textListener1( event )

    if ( event.phase == "began" ) then
      webBox.y = _H*.45

    elseif ( event.phase == "ended" or event.phase == "submitted" ) then
       native.setKeyboardFocus( nil )
       webBox.y = _H*1.35
    end
end
----
local function textListener2( event )

    if ( event.phase == "began" ) then
        postBox.y = _H*.45
    elseif ( event.phase == "ended" or event.phase == "submitted" ) then
       native.setKeyboardFocus( nil )
       postBox.y = _H*1.55
    end
end
---
local function textListener3( event )

    if ( event.phase == "began" ) then
        emailBox.y = _H*.45
    elseif ( event.phase == "ended" or event.phase == "submitted" ) then
       native.setKeyboardFocus( nil )
       emailBox.y = _H*1.15
    end
end
---
  local NameBox = native.newTextField( _W*1.2, _H*.35, _W*1.1, _H/8)
   sceneGroup:insert( NameBox)
    local nameText = display.newText( "Business Name", _W*.35, _H*.31, native.systemFont, _H/24)
     sceneGroup:insert( nameText)
         local nameText1 = display.newText( " نام بیزینس", _W*.35, _H*.39, native.systemFont, _H/20)
     sceneGroup:insert( nameText1)
    local jobBox = native.newTextField( _W*1.2, _H*.55, _W*1.1, _H/8)
     sceneGroup:insert( jobBox)
        local jobText = display.newText( "Job شغل", _W*.35, _H*.55, native.systemFont, _H/18)
         sceneGroup:insert( jobText)
      local phoneBox = native.newTextField( _W*1.2, _H*.75, _W*1.1, _H/8)
       sceneGroup:insert( phoneBox)
          local phoneText = display.newText( "Phone تلفن", _W*.35, _H*.75, native.systemFont, _H/18)
           sceneGroup:insert( phoneText)
             local addressBox = native.newTextField( _W*1.2, _H*.95, _W*1.1, _H/8)
   sceneGroup:insert( addressBox)
    local addressText = display.newText( "Address آدرس", _W*.35, _H*.95, native.systemFont, _H/20)
     sceneGroup:insert( addressText)
      emailBox = native.newTextField( _W*1.2, _H*1.15, _W*1.1, _H/8)
     sceneGroup:insert( emailBox)
        local emailText = display.newText( "Email ایمیل", _W*.35, _H*1.15, native.systemFont, _H/18)
         sceneGroup:insert( emailText)
        webBox = native.newTextField( _W*1.2, _H*1.35, _W*1.1, _H/8)
       sceneGroup:insert( webBox)
          local webText = display.newText( "Website وبسایت", _W*.35, _H*1.35, native.systemFont, _H/22)
           sceneGroup:insert( webText)
                   postBox = native.newTextField( _W*1.2, _H*1.55, _W*1.1, _H/8)
       sceneGroup:insert( postBox)
          local postText = display.newText( "Post Code", _W*.35, _H*1.51, native.systemFont, _H/20)
           sceneGroup:insert( postText)
                     local postText = display.newText( "کد پستی", _W*.35, _H*1.59, native.systemFont, _H/18)
           sceneGroup:insert( postText)
 ---
 NameBox:addEventListener( "userInput", textListener )
jobBox:addEventListener( "userInput", textListener )
phoneBox:addEventListener( "userInput", textListener )
addressBox:addEventListener( "userInput", textListener )
emailBox:addEventListener( "userInput", textListener3 )
webBox:addEventListener( "userInput", textListener1 )
postBox:addEventListener( "userInput", textListener2 )

  --register in parse and a file+
  local function saveBusiness( event )
  
           local function onCreateObject( event )
              if not event.error then
                 local alert = native.showAlert( "Save", "The business is registered.", { "Ok"} )
                     else
                   local alert = native.showAlert( "Error", "Email the details to info@jorc.com.au", { "Ok" } )
              end
           end
 local dataTable = { ["content"] = NameBox.text, ["job"] = jobBox.text, ["phone"] = phoneBox.text,  ["address"] = addressBox.text, ["email"] = emailBox.text, ["web"] = webBox.text, ["postcode"] = postBox.text}
  parse:createObject( "allJobs", dataTable, onCreateObject )

  end
 --end register in parse
---
   registerUserB = widget.newButton
{
    x=_W,
    y=_H*1.75,
    width = _W,
    height = _H/9,
    label = "Register",
    labelColor = { default={ 1, 1, 1 }, over={ 0, 1, 1 } },
    onPress = saveBusiness,
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