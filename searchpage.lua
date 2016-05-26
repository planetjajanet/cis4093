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
    local myText = display.newText("Search", display.contentCenterX, 200, Arial, 50)
    myText:setFillColor(0, 0, 0)

    --TEXT
    local myText1 = display.newText("Zip Code:", w/3, 350, Arial, 25)
    myText1:setFillColor(0, 0, 0)
    local myText2 = display.newText("Distance:", w/3, 420, Arial, 25)
    myText2:setFillColor(0, 0, 0)

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
    sceneGroup:insert(backbutton)

end

function scene:show( event )
    local sceneGroup = self.view

    params = event.params

    if event.phase == "did" then
    	--TEXT FIELDS
        zipBox = native.newTextField(420, 350, 220, 45)
        zipBox.isEditable = true
        
        distanceBox  = native.newTextField(420, 420, 220, 45)
        distanceBox.isEditable = true
    end
    
end

function scene:hide( event )
    local sceneGroup = self.view

    if event.phase == "will" then
        zipBox:removeSelf()
        distanceBox:removeSelf()
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