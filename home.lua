--Final App

local widget = require("widget")
local composer= require("composer")
local scene = composer.newScene()

display.setStatusBar(display.HiddenStatusBar)
local w, h = display.contentWidth, display.contentHeight

--4 FUNCTIONS FOR MENU OPTIONS 
local function gotoLogin (event)
	composer.gotoScene("loginpage")
end

local function gotoRegister (event)
	composer.gotoScene("regpage")
end

local function gotoSearch (event)
	composer.gotoScene("searchpage")
end

local function gotoSave (event)
	composer.gotoScene("savepage")
end

--SCENE IMPLEMENTATION
function scene:create( event )
    local sceneGroup = self.view

    --BACKGROUND
	local bg = display.newImage("images/bg.jpg")
	bg.width = display.contentWidth --changes width of image
	bg.height = display.contentHeight --changes height of image
	bg.x = display.contentWidth/2
	bg.y = display.contentHeight/ 2

	--TITLE PIC
	local title = display.newImage("images/findersdancers.png", 450, 350)
	title.width = 700
	title.height = 550

	--ICONS
    local search =display.newImage("images/search.png",w/4,h/2) 
	search.width = 150
	search.height = 150
	local save =display.newImage("images/save.png",w/2+170,h/2) 
	save.width = 150
	save.height = 150
	local login =display.newImage("images/login.png",w/4+10,h-300) 
	login.width = 400
	login.height = 400
	local register =display.newImage("images/register.png",w/2+193,h-300) 
	register.width = 150
	register.height = 150

	--LOGIN BUTTON
    	local loginButton = widget.newButton{
    		label="LOGIN",
    		labelColor = { default = { 0,0,0 }, over = { 163, 25, 12} },
    		font = "Arial Bold",
    		fontSize =40,
    		onEvent=gotoLogin
    		}
    	loginButton.x=display.contentCenterX-168
    	loginButton.y=display.contentCenterY+470

    	--REGISTER BUTTON
    	local regButton = widget.newButton{
    		label="REGISTER",
    		labelColor = { default = { 0,0,0 }, over = { 163, 25, 12} },
    		font = "Arial Bold",
    		fontSize =40,
    		onEvent=gotoRegister
    		}
    	regButton.x = display.contentCenterX+178
    	regButton.y = display.contentCenterY+470

    	--SEARCH BUTTON
    	local searchButton = widget.newButton{
    		label="SEARCH",
    		labelColor = { default = { 0,0,0 }, over = { 163, 25, 12} },
    		font = "Arial Bold",
    		fontSize =40,
    		onEvent=gotoSearch
    		}
    	searchButton.x = display.contentCenterX-170
    	searchButton.y = display.contentCenterY+120

    	--SAVE BUTTON
    	local saveButton = widget.newButton{
    		label="SAVED",
    		labelColor = { default = { 0,0,0 }, over = { 163, 25, 12} },
    		font = "Arial Bold",
    		fontSize =40,
    		onEvent=gotoSave
    		}
    	saveButton.x = display.contentCenterX+170
    	saveButton.y = display.contentCenterY+120

    sceneGroup:insert(bg, false)
    sceneGroup:insert(title, false)
	sceneGroup:insert(search, false)
	sceneGroup:insert(save, false)
	sceneGroup:insert(login, false)
	sceneGroup:insert(register, false)
	sceneGroup:insert(searchButton, false)
	sceneGroup:insert(regButton, false)
	sceneGroup:insert(loginButton, false)
	sceneGroup:insert(saveButton, false)

end

function scene:show( event )
    local sceneGroup = self.view

    params = event.params

    if event.phase == "did" then

    end
    
end

function scene:hide( event )
    local sceneGroup = self.view

    if event.phase == "will" then
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

