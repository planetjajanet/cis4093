local widget = require("widget")
local composer= require("composer")
local scene = composer.newScene()

display.setStatusBar(display.HiddenStatusBar)
local w, h = display.contentWidth, display.contentHeight


function gotoHome (event)
    composer.gotoScene("home")
end

function scene:create( event )
    local sceneGroup = self.view

    --BACKGROUND
    local bg = display.newImage("images/login_bg.jpg")
        bg.width = display.contentWidth --changes width of image
        bg.height = display.contentHeight --changes height of image
        bg.x = display.contentWidth/2
        bg.y = display.contentHeight/ 2

    --TITLE
    local myText = display.newText("Register", display.contentCenterX, 200, Arial, 50)
    myText:setFillColor(0, 0, 0)

    --TEXT
    local myText1 = display.newText("Dance Company/ \n Individual Name:", 250, 350, 320, 0, Arial, 25)
    myText1:setFillColor(0, 0, 0)
    local myText2 = display.newText("Username:", 240, 420, Arial, 25)
    myText2:setFillColor(0, 0, 0)
    local myText3 = display.newText("Password:", 240, 490, Arial, 25)
    myText3:setFillColor(0, 0, 0)
    local myText4 = display.newText("Address:", 250, 560, Arial, 25)
    myText4:setFillColor(0, 0, 0)
    local myText5 = display.newText("City:", 275, 630, Arial, 25)
    myText5:setFillColor(0, 0, 0)
    local myText6 = display.newText("State:", 270, 700, Arial, 25)
    myText6:setFillColor(0, 0, 0)
    local myText7 = display.newText("Zip Code:", 250, 770, Arial, 25)
    myText7:setFillColor(0, 0, 0)
    local myText8 = display.newText("Phone Number:", 210, 840, Arial, 25)
    myText8:setFillColor(0, 0, 0)
    local myText9 = display.newText("Email:", 270, 910, Arial, 25)
    myText9:setFillColor(0, 0, 0)

    --REGISTER BUTTON
    local regSubmit = widget.newButton{
        
        label="Go",
        font = "Arial Bold",
        fontSize =40,
        strokeColor = { default={0,0,1}, over={0.8,0.8,1,1} },
    }

    regSubmit.x=display.contentCenterX
    regSubmit.y=display.contentCenterY+380

    --BACK BUTTON
    local backbutton = widget.newButton{
            label="Back",
            labelColor = { default = { 0,0,0 }, over = { 163, 25, 12} },
            font = "Arial Bold",
            fontSize =40,
            onEvent = gotoHome
        }
        backbutton.x = display.contentCenterX-240
        backbutton.y = display.contentCenterY+540

    sceneGroup:insert(bg)
    sceneGroup:insert(myText)
    sceneGroup:insert(myText1)
    sceneGroup:insert(myText2)
    sceneGroup:insert(myText3)
    sceneGroup:insert(myText4)
    sceneGroup:insert(myText5)
    sceneGroup:insert(myText6)
    sceneGroup:insert(myText7)
    sceneGroup:insert(myText8)
    sceneGroup:insert(myText9)
    sceneGroup:insert(regSubmit)
    sceneGroup:insert(backbutton)

end

function scene:show( event )
    local sceneGroup = self.view

    if event.phase == "did" then
    	--TEXT FIELDS
    nameBox = native.newTextField(460, 350, 280, 45)
    nameBox.isEditable = true
    
    userBox = native.newTextField(460, 420, 280, 45)
    userBox.isEditable = true
    
    passBox = native.newTextField(460, 490, 280, 45)
    passBox.isEditable = true
    passBox.isSecure = true
    
    addressBox = native.newTextField(460, 560, 280, 45)
    addressBox.isEditable = true
    
    cityBox = native.newTextField(460, 630, 280, 45)
    cityBox.isEditable = true
    
    stateBox = native.newTextField(460, 700, 280, 45)
    stateBox.isEditable = true
    
    zipBox = native.newTextField(460, 770, 280, 45)
    zipBox.isEditable = true
    
    phoneBox = native.newTextField(460, 840, 280, 45)
    phoneBox.isEditable = true
    
    emailBox = native.newTextField(460, 910, 280, 45)
    emailBox.isEditable = true
    
    end
    
end

function scene:hide( event )
    local sceneGroup = self.view

    if event.phase == "will" then
        nameBox:removeSelf()
        userBox:removeSelf()
        passBox:removeSelf()
        addressBox:removeSelf()
        cityBox:removeSelf()
        stateBox:removeSelf()
        zipBox:removeSelf()
        phoneBox:removeSelf()
        emailBox:removeSelf()
    end
    
end

function scene:destroy( event )
    local sceneGroup = self.view    
        
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene