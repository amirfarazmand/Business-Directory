local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
-- Called when the scene's view does not exist:
          backButton = "singleList"
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
	local teeDate = display.newText( "Select a job to search\nشغل مورد جستجو را انتخاب کنید ", 0, 0,_W*1.3,_H,native.systemFontBold, _W*.08 )
	teeDate:setFillColor( 0,0,1 )
	teeDate.x, teeDate.y = _W*1.15 , _H*.55
	sceneGroup:insert( teeDate )
	dayTemp=tonumber(string.sub(os.date(),0,-16))
	----
 local function back( event )
   composer.gotoScene( "sceneMain", "slideRight", 400 )
   composer.removeScene( "singleList" )
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
  local function teeRowRender( event )
     -- Get reference to the row group
    local row = event.row

    -- Cache the row "contentWidth" and "contentHeight" because the row bounds can change as children objects are added
    local rowHeight = row.contentHeight
    local rowWidth = row.contentWidth
     local jobText = display.newText( row, row.id.."  "..allJobsTran[singleListData][row.id], 0, 0, systemFontBold, 25 )
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
 local function sbusView( event )
      local row = event.row
      searchItem = row.id
   composer.gotoScene( "searchList", "slideUp", 400 )

end
 ---
 teeList = widget.newTableView
 {
    left = 0,
    top = _H/4,
    height = _H*1.7,
    width = _W*2,
    onRowRender = teeRowRender,
    onRowTouch = sbusView,
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

allJobs["Building"]={"Builder", "Electrician", "Painter", "Plumber", "CabinetMaker","Cleaner"}
allJobsTran["Building"]={["Builder"]= "نجار بنا یا بیلدر", ["Electrician"]= "برقکار", ["Painter"]= "نقاش", ["Plumber"]= "لوله کش آب و گاز", ["CabinetMaker"] ="کابینت ساز", ["Cleaner"]= "نظافت منزل"}

allJobs["Bank and Finanacial"]={"Accountant", "Car Loan", "Home Loan","Business Loan", "MoneyExchange"}
allJobsTran["Bank and Finanacial"]={["Accountant"]="حسابدار",["Car Loan"]= "وام ماشین", ["Home Loan"] = "خانه وام",["Business Loan"]= "کسب و کار وام", ["MoneyExchange"]="صرافی"}

allJobs["Beauty"]= {"HairdresserMan", "HairdresserWoman", "BeautyWoman"}
allJobsTran["Beauty"]= {["HairdresserMan"]= "آرایشگاه مرد", ["HairdresserWoman"]= "آرایشگاه زن" , ["BeautyWoman"]="زیبایی زنان"}

allJobs["Car"]= {"Dealer", "Parts", "Tyre"}
allJobsTran["Car"]= {["Dealer"]= "خرید فروش", ["Parts"]= "قطعات" , ["Tyre"]="لاستیک"}

allJobs["Consultant"]= {"Building", "Business", "Investment", "Computer"}
allJobsTran["Consultant"]= {["Building"]= "مهندس ساختمان", ["Business"]= "تجارت و کسب و کار" , ["Investment"]="سرمایه گذاری", ["Computer"]="شبکه نرم افزار کامپیوتر"}

allJobs["Events"]= {"Wedding", "Funeral", "Birthday/Misc"}
allJobsTran["Events"]= {["Wedding"]= "عروسی‌", ["Funeral"]="ختم", ["Birthday/Misc"]="تولد و غیره"}

allJobs["Furniture"]= {"Removalist", "Carpet", "Curtain", "Satellite/Antenna"}
allJobsTran["Furniture"]= {["Removalist"]= "جابجائی لوازم منزل", ["Carpet"]= "فرش", ["Curtain"]= "پرده", ["Satellite/Antenna"]= "ماهواره"}

allJobs["Food"]= {"Restaurant", "Grocery", "Cafe"}
allJobsTran["Food"]= {["Restaurant"]= "رستوران", ["Grocery"]="مواد غذایی", ["Cafe"]="بار و کافه"}

allJobs["Insurance"]= {"Car Insurance", "House Insurance", "Travel Insurance", "Business Insurance"}
allJobsTran["Insurance"]= {["Car Insurance"]= "ماشین", ["House Insurance"]= "خانه", ["Travel Insurance"]="سفر", ["Business Insurance"]="بیزینس"}

allJobs["Jewellery"]={"Gold", "MiscellaneousJew"}
allJobsTran["Jewellery"]={["Gold"]= "طلا", ["MiscellaneousJew"]= "غیره"}

allJobs["Legal"]= {"Family Laywer", "Immigration Lawyer", "Criminal Lawyer", "Commercial Lawyer"}
allJobsTran["Legal"]= {["Family Laywer"]= "وکیل خانواده", ["Immigration Lawyer"]= "وکیل مهاجرت" , ["Criminal Lawyer"]= "وکیل جنایی", ["Commercial Lawyer"]="وکیل تجاری"}

allJobs["Medical"]={"GP", "Dentist", "Dermatologist", "Gynecologist", "Pediatrician", "Audiologist", "Optometrist"}
allJobsTran["Medical"]={["GP"]= "پزشک عمومی", ["Dentist"]= "دندانپزشک", ["Gynecologist"]= "متخصص زنان و زایمان", ["Pediatrician"]= "متخصص اطفال", ["Audiologist"]="شنوایی", ["Optometrist"]="بینایی", ["Dermatologist"]="پوست"}

allJobs["Photoshop"]={"Events", "MiscellaneousPhoto"}
allJobsTran["Photoshop"]={["Events"]= "عروسی‌ و باقی‌ مراسم", ["MiscellaneousPhoto"]= "غیره"}

allJobs["Repairer"]={"Electrical", "Carpet", "MiscellaneousRep"}
allJobsTran["Repairer"]={["Electrical"]= "لوازم برقی‌", ["Carpet"]= "قالی", ["MiscellaneousRep"]= "غیره"}

allJobs["Teacher"]={"High School", "Primary School", "Music", "Driving", "Computer"}
allJobsTran["Teacher"]={["High School"]= "دبیرستان", ["Primary School"]="ابتدایی", ["Music"]= "موسیقی", ["Driving"]="رانندگی‌", ["Computer"]="کامپیوتر"}

allJobs["Travel"]={"Ticket", "Taxi"}
allJobsTran["Travel"]={["Ticket"]= "بلیت", ["Taxi"]="تاکسی"}

allJobs["Translation"]={"NATI", "MiscellaneousTran"}
allJobsTran["Translation"]={["NATI"]= "رسمی‌", ["MiscellaneousTran"]="غیره"}

allJobs["Gallery/Exhibition"]={"Permanent", "Temporary"}
allJobsTran["Gallery/Exhibition"]={["Permanent"]= "دائمی", ["Temporary"]="موقت"}

allJobs["Traditional"]={"Medicine", "MiscellaneousTrad"}
allJobsTran["Traditional"]={["Medicine"]= "دارو دمنوش گیاهی", ["MiscellaneousTrad"]="غیره"}

allJobs["Advertisement"]={"Newspaper", "Google", "MiscellaneousAd"}
allJobsTran["Advertisement"]={["Newspaper"]= "روزنامه", ["Google"]="آنلاین", ["MiscellaneousAd"]="غیره"}

allJobs["Mechanic"]={"Carmechanic", "Motormechanic"}
allJobsTran["Mechanic"]={["Carmechanic"]= "ماشین", ["Motormechanic"]="موتور"}

 for i=1,#allJobs[singleListData] do
    teeList:insertRow{
   id = allJobs[singleListData][i], 
     rowHeight = _H/6,
     isCategory = false,
  }
 end 

end -- end of scene:create( event )
---------------
function scene:show( event )
	
	local phase = event.phase
	
	if "did" == phase then
	
		-- remove previous scene's view
	
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