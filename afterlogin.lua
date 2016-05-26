local widget = require("widget")
local composer= require("composer")
local scene = composer.newScene()


display.setStatusBar(display.HiddenStatusBar)
local w, h = display.contentWidth, display.contentHeight

function gotoLogin (event)
	composer.gotoScene("loginpage")
end

function scene:create( event )
    local sceneGroup = self.view
    
    --BACKGROUND
    local bg = display.newImage("images/login_bg.jpg")
    bg.width = display.contentWidth --changes width of image
    bg.height = display.contentHeight --changes height of image
    bg.x = display.contentWidth/2
    bg.y = display.contentHeight/ 2

    --TITLE OF PAGE
	local myText1 = display.newText("Create Schedule", display.contentCenterX, 200, Arial, 50)
    myText1:setFillColor(0, 0, 0)

    --TEXT
    local myText2 = display.newText("Choose date and time:", display.contentCenterX, 280, Arial, 20)
    myText2:setFillColor(0, 0, 0)
    local myText3 = display.newText("Enter location:", display.contentCenterX, 840, Arial, 20)
    myText3:setFillColor(0, 0, 0)
    local myText4 = display.newText("Description:", display.contentCenterX, 940, Arial, 20)
    myText4:setFillColor(0, 0, 0)


    --DATE PICKER WHEEL
	-- Create two tables to hold data for days and years      
	local days = {}
	local years = {}

	-- Populate the "days" table
	for d = 1, 31 do
	    days[d] = d
	end

	-- Populate the "years" table
	for y = 1, 10 do
	    years[y] = 2015 + y
	end

	-- Configure the picker wheel columns
	local columnData = 
	{
	    -- Months
	    { 
	        align = "right",
	        width = 140,
	        startIndex = 6,
	        labels = { "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" }
	    },
	    -- Days
	    {
	        align = "center",
	        width = 60,
	        startIndex = 15,
	        labels = days
	    },
	    -- Years
	    {
	        align = "center",
	        width = 80,
	        startIndex = 1,
	        labels = years
	    }
	}

	-- Create the widget
	local dateWheel = widget.newPickerWheel(
	    {
	        top = 300,
	        left = 200,
	        columns = columnData
	    }
	)

	--TIME PICKER WHEEL
	local hour = {}
	local minute = {}

	for h = 1, 12 do
	    hour[h] = h
	end

	local columnData = 
	{
	    -- Hour
	    {
	        align = "right",
	        width = 140,
	        startIndex = 6,
	        labels = hour
	    },
	    -- Minute
	    {
	        align = "center",
	        width = 60,
	        startIndex = 30,
	        labels = {"00","01","02","03","04","05","06","07","08","09","10",
	        "11","12","13","14","15","16","17","18","19","20",
	        "21","22","23","24","25","26","27","28","29","30",
	        "31","32","33","34","35","36","37","38","39","40",
	        "41","42","43","44","45","46","47","48","49","50",
	        "51","52","53","54","55","56","57","58","59"}
	    },
	    -- Am/Pm
	    { 
	        align = "center",
	        width = 80,
	        startIndex = 1,
	        labels = { "A.M.", "P.M." }
	    }
	}

	-- Create the widget
	local timeWheel = widget.newPickerWheel(
	    {
	        top = 550,
	        left = 200,
	        columns = columnData
	    })

    --BACK BUTTON
    local backbutton = widget.newButton{
        label="Back",
        labelColor = { default = { 0,0,0 }, over = { 163, 25, 12} },
        font = "Arial Bold",
        fontSize =40,
        onEvent = gotoLogin
        }
    backbutton.x = display.contentCenterX-240
    backbutton.y = display.contentCenterY+540

    --CREATE BUTTON
    local createButton = widget.newButton{
	    label="Create",
	    font = "Arial Bold",
	    fontSize =40,
	    strokeColor = { default={0,0,1}, over={0.8,0.8,1,1} }
	}

	createButton.x = display.contentCenterX
    createButton.y = 1100

    sceneGroup:insert(bg)
    sceneGroup:insert(myText1)
    sceneGroup:insert(myText2)
    sceneGroup:insert(myText3)
    sceneGroup:insert(myText4)
    sceneGroup:insert(backbutton)
    sceneGroup:insert(dateWheel)
    sceneGroup:insert(timeWheel)
    sceneGroup:insert(createButton)

end

function scene:show( event )
    local sceneGroup = self.view

    if event.phase == "did" then
    	--TEXT FIELD
        locationBox = native.newTextField(display.contentCenterX, 880, 320, 45)
        locationBox.isEditable = true
        descBox = native.newTextField(display.contentCenterX, 1005, 320, 90)
        descBox.isEditable = true
    end
    
end

function scene:hide( event )
    local sceneGroup = self.view

    if event.phase == "will" then
    	locationBox:removeSelf()
    	descBox:removeSelf()
    end
    
end

function scene:destroy( event )
    local sceneGroup = self.view    
    display.remove(backbutton)
        
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene
