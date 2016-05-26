
local sqlite3 = require("sqlite3")
local widget = require("widget")
local composer= require("composer")
local scene = composer.newScene()

--DATABASE
local path = system.pathForFile("dance.db", system.ResourceDirectory)
local db = sqlite3.open(path, "r")


local function onSystemEvent( event )
    if ( event.type == "applicationExit" ) then              
        db:close()
    end
end


--===========================

local w, h = display.contentWidth, display.contentHeight

function gotoAfterLogin(event)
    for row in db:nrows("select * from login") do 
        --below is just a test to see if db works and for me to see what the values are
        --local text = "USER: "..row.user.." ".."PASS: "..row.pass
        --local t = display.newText( text, 360, 300, nil, 16 )
        --t:setFillColor( 1, 0, 0 )
        if userBox.text == row.user and passBox.text == row.pass then
            composer.gotoScene("afterlogin")
        end
    end
end

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

    --TITLE OF PAGE
    local myText = display.newText("LOGIN", display.contentCenterX, 200, Arial, 50)
    myText:setFillColor(0, 0, 0)

    --TEXT
    local myText1 = display.newText("Username:", w/3, 350, Arial, 25)
    myText1:setFillColor(0, 0, 0)
    local myText2 = display.newText("Password:", w/3, 420, Arial, 25)
    myText2:setFillColor(0, 0, 0)

    --LOGIN BUTTON
    local loginSubmit = widget.newButton{
    label="Go",
    font = "Arial Bold",
    fontSize =40,
    strokeColor = { default={0,0,1}, over={0.8,0.8,1,1} },
    onEvent = gotoAfterLogin
}

loginSubmit.x=display.contentCenterX
loginSubmit.y=display.contentCenterY-130

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
    sceneGroup:insert(loginSubmit)
    sceneGroup:insert(backbutton)

end

function scene:show( event )
    local sceneGroup = self.view

    if event.phase == "did" then
        --TEXT FIELD
        userBox = native.newTextField(420, 350, 220, 45)
        userBox.isEditable = true
        passBox = native.newTextField(420, 420, 220, 45)
        passBox.isEditable = true
        passBox.isSecure = true
    end
    
end

function scene:hide( event )
    local sceneGroup = self.view

    if event.phase == "will" then
        userBox:removeSelf()
        passBox:removeSelf()
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

