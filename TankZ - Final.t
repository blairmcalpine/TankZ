%===========================================================================================================
%TankZ
%Blair McAlpine
%April 2018
%Turing 4.1 version 1.0.1
%
%===========================================================================================================
%This program is a multiplayer game in which 2 people go head to head by controlling tanks and their weapons
%
%===========================================================================================================
%Features
%Many variables, ranging from positional variables to accumulators
%1 Procedure
%5 Processes
%123 different images with animations
%5 music files
%Keyboard input
%Mouse Input
%Changable options for the game
%Intuitive how to play section
%Exit button
%Different maps, map selection
%Animated Health Bars
%Animated bullets and mines
%Rotatable Tanks
%
%===========================================================================================================
%
View.Set ("graphics:1500;1000,position:center;center,nobuttonbar,title:TankZ")
%Variables
var tank1X, tank1Y, position1, tank2X, tank2Y, position2, direction1, direction2, spinTimer1, spinTimer2, drawBullet1, drawBullet2, countDownFont, powerUpSpawnTime, powerUpPos, powerUpTimer,
    drawPowerUp, tank1MaxHealth, tank2MaxHealth,
    optionsFont, tank1MaxHealthConst, tank2MaxHealthConst, mineMaxTimeConst, tank1SpeedConst, tank2SpeedConst, powerUpSpawnTimeConst, bullet1DamageConst, bullet2DamageConst, bulletSpeedConst,
    mineDamageConst, mineRadiusConst, bullet1X,
    bullet1Y, bullet2X, bullet2Y, tank1Health, tank2Health, bulletTimer1, bulletTimer2, winner, mouseX, mouseY, mouseButton, mine1X, mine1Y, mine2X, mine2Y, mineTimer1, mineTimer2, powerUpType,
    tank1Speed, tank2Speed, healthFont,
    tank1top, tank1bottom, tank1side1, tank1side2, tank2top, tank2bottom, tank2side1, tank2side2, bullet1Midair, bullet2Midair, countDown, mineMaxTime, drawMine1, drawMine2, mineRadius, powerUpX,
    powerUpY, bullet1Damage, bullet2Damage,
    optionsPage, bulletSpeed, mineDamage, controlsPage, randomMap, drawExplosion, textColour, exitCondition, explosionTimer1, explosionTimer2, winCount1, winCount2 : int
var enablePowerUp, enablePowerUpConst, tankAutoTurnConst, tankAutoTurn : string
%Fonts
countDownFont := Font.New ("System:140:bold")
healthFont := Font.New ("System:50")
optionsFont := Font.New ("System:75")
%Map
var player1win : int := Pic.FileNew ("Images/player1win.bmp")
var player2win : int := Pic.FileNew ("Images/player2win.bmp")
var startscreen : int := Pic.FileNew ("Images/startscreen.bmp")
var startScreenTank1 : int := Pic.FileNew ("Images/startscreentank1.bmp")
var startScreenTank2 : int := Pic.FileNew ("Images/startscreentank2.bmp")
var background : int := Pic.FileNew ("Images/map.bmp")
var background2 : int := Pic.FileNew ("Images/map2.bmp")
var background3 : int := Pic.FileNew ("Images/map3.bmp")
var optionsPage1 : int := Pic.FileNew ("Images/optionsPage1.bmp")
var optionsPage2 : int := Pic.FileNew ("Images/optionsPage2.bmp")
var controlsScreen : int := Pic.FileNew ("Images/controlsScreen.bmp")
var howToPlay : int := Pic.FileNew ("Images/howToPlay.bmp")
var powerUps : int := Pic.FileNew ("Images/powerUps.bmp")
var mapSelect0 : int := Pic.FileNew ("Images/mapSelect0.bmp")
var mapSelect1 : int := Pic.FileNew ("Images/mapSelect1.bmp")
var mapSelect2 : int := Pic.FileNew ("Images/mapSelect2.bmp")
var mapSelect3 : int := Pic.FileNew ("Images/mapSelect3.bmp")
%Tank1
var tank1up0 : int := Pic.FileNew ("Images/tank1up0.bmp")
var tank1up45 : int := Pic.FileNew ("Images/tank1up45.bmp")
var tank1up90 : int := Pic.FileNew ("Images/tank1up90.bmp")
var tank1up135 : int := Pic.FileNew ("Images/tank1up135.bmp")
var tank1up180 : int := Pic.FileNew ("Images/tank1up180.bmp")
var tank1up225 : int := Pic.FileNew ("Images/tank1up225.bmp")
var tank1up270 : int := Pic.FileNew ("Images/tank1up270.bmp")
var tank1up315 : int := Pic.FileNew ("Images/tank1up315.bmp")
var tank1down0 : int := Pic.FileNew ("Images/tank1down0.bmp")
var tank1down45 : int := Pic.FileNew ("Images/tank1down45.bmp")
var tank1down90 : int := Pic.FileNew ("Images/tank1down90.bmp")
var tank1down135 : int := Pic.FileNew ("Images/tank1down135.bmp")
var tank1down180 : int := Pic.FileNew ("Images/tank1down180.bmp")
var tank1down225 : int := Pic.FileNew ("Images/tank1down225.bmp")
var tank1down270 : int := Pic.FileNew ("Images/tank1down270.bmp")
var tank1down315 : int := Pic.FileNew ("Images/tank1down315.bmp")
var tank1left0 : int := Pic.FileNew ("Images/tank1left0.bmp")
var tank1left45 : int := Pic.FileNew ("Images/tank1left45.bmp")
var tank1left90 : int := Pic.FileNew ("Images/tank1left90.bmp")
var tank1left135 : int := Pic.FileNew ("Images/tank1left135.bmp")
var tank1left180 : int := Pic.FileNew ("Images/tank1left180.bmp")
var tank1left225 : int := Pic.FileNew ("Images/tank1left225.bmp")
var tank1left270 : int := Pic.FileNew ("Images/tank1left270.bmp")
var tank1left315 : int := Pic.FileNew ("Images/tank1left315.bmp")
var tank1right0 : int := Pic.FileNew ("Images/tank1right0.bmp")
var tank1right45 : int := Pic.FileNew ("Images/tank1right45.bmp")
var tank1right90 : int := Pic.FileNew ("Images/tank1right90.bmp")
var tank1right135 : int := Pic.FileNew ("Images/tank1right135.bmp")
var tank1right180 : int := Pic.FileNew ("Images/tank1right180.bmp")
var tank1right225 : int := Pic.FileNew ("Images/tank1right225.bmp")
var tank1right270 : int := Pic.FileNew ("Images/tank1right270.bmp")
var tank1right315 : int := Pic.FileNew ("Images/tank1right315.bmp")
%Tank2
var tank2up0 : int := Pic.FileNew ("Images/tank2up0.bmp")
var tank2up45 : int := Pic.FileNew ("Images/tank2up45.bmp")
var tank2up90 : int := Pic.FileNew ("Images/tank2up90.bmp")
var tank2up135 : int := Pic.FileNew ("Images/tank2up135.bmp")
var tank2up180 : int := Pic.FileNew ("Images/tank2up180.bmp")
var tank2up225 : int := Pic.FileNew ("Images/tank2up225.bmp")
var tank2up270 : int := Pic.FileNew ("Images/tank2up270.bmp")
var tank2up315 : int := Pic.FileNew ("Images/tank2up315.bmp")
var tank2down0 : int := Pic.FileNew ("Images/tank2down0.bmp")
var tank2down45 : int := Pic.FileNew ("Images/tank2down45.bmp")
var tank2down90 : int := Pic.FileNew ("Images/tank2down90.bmp")
var tank2down135 : int := Pic.FileNew ("Images/tank2down135.bmp")
var tank2down180 : int := Pic.FileNew ("Images/tank2down180.bmp")
var tank2down225 : int := Pic.FileNew ("Images/tank2down225.bmp")
var tank2down270 : int := Pic.FileNew ("Images/tank2down270.bmp")
var tank2down315 : int := Pic.FileNew ("Images/tank2down315.bmp")
var tank2left0 : int := Pic.FileNew ("Images/tank2left0.bmp")
var tank2left45 : int := Pic.FileNew ("Images/tank2left45.bmp")
var tank2left90 : int := Pic.FileNew ("Images/tank2left90.bmp")
var tank2left135 : int := Pic.FileNew ("Images/tank2left135.bmp")
var tank2left180 : int := Pic.FileNew ("Images/tank2left180.bmp")
var tank2left225 : int := Pic.FileNew ("Images/tank2left225.bmp")
var tank2left270 : int := Pic.FileNew ("Images/tank2left270.bmp")
var tank2left315 : int := Pic.FileNew ("Images/tank2left315.bmp")
var tank2right0 : int := Pic.FileNew ("Images/tank2right0.bmp")
var tank2right45 : int := Pic.FileNew ("Images/tank2right45.bmp")
var tank2right90 : int := Pic.FileNew ("Images/tank2right90.bmp")
var tank2right135 : int := Pic.FileNew ("Images/tank2right135.bmp")
var tank2right180 : int := Pic.FileNew ("Images/tank2right180.bmp")
var tank2right225 : int := Pic.FileNew ("Images/tank2right225.bmp")
var tank2right270 : int := Pic.FileNew ("Images/tank2right270.bmp")
var tank2right315 : int := Pic.FileNew ("Images/tank2right315.bmp")
%Tank1Bullets
var bullet1down : int := Pic.FileNew ("Images/bullet1down.bmp")
var bullet1left : int := Pic.FileNew ("Images/bullet1left.bmp")
var bullet1up : int := Pic.FileNew ("Images/bullet1up.bmp")
var bullet1right : int := Pic.FileNew ("Images/bullet1right.bmp")
var bullet1upleft : int := Pic.FileNew ("Images/bullet1upleft.bmp")
var bullet1upright : int := Pic.FileNew ("Images/bullet1upright.bmp")
var bullet1downleft : int := Pic.FileNew ("Images/bullet1downleft.bmp")
var bullet1downright : int := Pic.FileNew ("Images/bullet1downright.bmp")
%Tank2Bullets
var bullet2down : int := Pic.FileNew ("Images/bullet2down.bmp")
var bullet2left : int := Pic.FileNew ("Images/bullet2left.bmp")
var bullet2up : int := Pic.FileNew ("Images/bullet2up.bmp")
var bullet2right : int := Pic.FileNew ("Images/bullet2right.bmp")
var bullet2upleft : int := Pic.FileNew ("Images/bullet2upleft.bmp")
var bullet2upright : int := Pic.FileNew ("Images/bullet2upright.bmp")
var bullet2downleft : int := Pic.FileNew ("Images/bullet2downleft.bmp")
var bullet2downright : int := Pic.FileNew ("Images/bullet2downright.bmp")
%Mines
var bomb2stage1 : int := Pic.FileNew ("Images/bomb2stage1.bmp")
var bomb2stage2 : int := Pic.FileNew ("Images/bomb2stage2.bmp")
var bomb2stage3 : int := Pic.FileNew ("Images/bomb2stage3.bmp")
var bomb2stage4 : int := Pic.FileNew ("Images/bomb2stage4.bmp")
var bomb2stage5 : int := Pic.FileNew ("Images/bomb2stage5.bmp")
var bomb2stage6 : int := Pic.FileNew ("Images/bomb2stage6.bmp")
var bomb2stage7 : int := Pic.FileNew ("Images/bomb2stage7.bmp")
var bomb2stage8 : int := Pic.FileNew ("Images/bomb2stage8.bmp")
var bomb2stage9 : int := Pic.FileNew ("Images/bomb2stage9.bmp")
var bomb2stage10 : int := Pic.FileNew ("Images/bomb2stage10.bmp")
var bomb1stage1 : int := Pic.FileNew ("Images/bomb1stage1.bmp")
var bomb1stage2 : int := Pic.FileNew ("Images/bomb1stage2.bmp")
var bomb1stage3 : int := Pic.FileNew ("Images/bomb1stage3.bmp")
var bomb1stage4 : int := Pic.FileNew ("Images/bomb1stage4.bmp")
var bomb1stage5 : int := Pic.FileNew ("Images/bomb1stage5.bmp")
var bomb1stage6 : int := Pic.FileNew ("Images/bomb1stage6.bmp")
var bomb1stage7 : int := Pic.FileNew ("Images/bomb1stage7.bmp")
var bomb1stage8 : int := Pic.FileNew ("Images/bomb1stage8.bmp")
var bomb1stage9 : int := Pic.FileNew ("Images/bomb1stage9.bmp")
var bomb1stage10 : int := Pic.FileNew ("Images/bomb1stage10.bmp")
var explosion : int := Pic.FileNew ("Images/explosion.bmp")
%Power Ups
var powerUpHealth : int := Pic.FileNew ("Images/powerUpHeal.bmp")
var powerUpIncreaseHeal : int := Pic.FileNew ("Images/powerUpIncreaseHeal.bmp")
var powerUpSpeed : int := Pic.FileNew ("Images/powerUpSpeed.bmp")
var powerUpDoubleDamage : int := Pic.FileNew ("Images/powerUpDoubleDamage.bmp")
%Keyboard Variable
var input : array char of boolean
%Win Counts
winCount1 := 0
winCount2 := 0
%Starting Value for customizable values
procedure resetOptions
    tank1MaxHealthConst := 100
    tank2MaxHealthConst := 100
    mineMaxTimeConst := 1000
    powerUpSpawnTimeConst := 10000
    mineRadiusConst := 70
    tank1SpeedConst := 10
    tank2SpeedConst := 10
    bullet1DamageConst := 20
    bullet2DamageConst := 20
    enablePowerUpConst := "Yes"
    bulletSpeedConst := 50
    tankAutoTurnConst := "Yes"
    mineDamageConst := 60
end resetOptions
resetOptions
%Music Processes (to play music)
process startScreen
    Music.PlayFile ("Music/startScreen.mp3")
end startScreen
fork startScreen
process inGame
    Music.PlayFile ("Music/inGame.mp3")
end inGame
process countDownSound
    Music.PlayFile ("Music/countDown.mp3")
end countDownSound
process countDownSound2
    Music.PlayFile ("Music/countDown2.mp3")
end countDownSound2
process victory
    Music.PlayFile ("Music/victory.mp3")
end victory
loop
    %Setting variables that have changed mid-game back to starting values
    tank1MaxHealth := tank1MaxHealthConst
    tank2MaxHealth := tank2MaxHealthConst
    mineMaxTime := mineMaxTimeConst
    powerUpSpawnTime := powerUpSpawnTimeConst
    mineRadius := mineRadiusConst
    tank1Speed := tank1SpeedConst
    tank2Speed := tank2SpeedConst
    bullet1Damage := bullet1DamageConst
    bullet2Damage := bullet2DamageConst
    enablePowerUp := enablePowerUpConst
    bulletSpeed := bulletSpeedConst
    tankAutoTurn := tankAutoTurnConst
    mineDamage := mineDamageConst
    tank1Y := 450
    tank1X := 55
    tank2Y := 450
    tank2X := 1445
    position1 := 4
    position2 := 2
    direction1 := 2
    direction2 := 6
    spinTimer1 := 0
    spinTimer2 := 0
    drawBullet1 := 0
    drawBullet2 := 0
    bullet1Midair := 9
    bullet2Midair := 9
    tank1Health := tank1MaxHealth
    tank2Health := tank2MaxHealth
    bullet1X := -100
    bullet1Y := -100
    bullet2X := -100
    bullet2Y := -100
    bulletTimer1 := 0
    bulletTimer2 := 0
    countDown := 1
    countDown := 1
    drawMine1 := 0
    drawMine2 := 0
    mineTimer1 := 0
    mineTimer2 := 0
    powerUpTimer := 0
    powerUpPos := 0
    drawPowerUp := 0
    optionsPage := 1
    controlsPage := 1
    drawExplosion := 0
    exitCondition := 0
    winner := 5
    explosionTimer1 := 0
    explosionTimer2 := 0
    %Draws the menu
    Pic.Draw (startscreen, 0, 0, 0)
    %Gets a mouse input
    Mouse.Where (mouseX, mouseY, mouseButton)
    %Play Button - If mouse location is on the play button, draw the 2 tanks beside it
    if mouseX >= 630 and mouseX <= 871 and mouseY >= 572 and mouseY <= 698 then
	Pic.Draw (startScreenTank1, 468, 602, picMerge)
	Pic.Draw (startScreenTank2, 901, 602, picMerge)
    end if
    %Play Button - If mouse location is on the play button and you are clicking the button, enter the game
    if mouseX >= 630 and mouseX <= 871 and mouseY >= 572 and mouseY <= 698 and mouseButton = 1 then
	loop
	    Mouse.Where (mouseX, mouseY, mouseButton)
	    if mouseButton = 0 then
		exit
	    end if
	end loop
	loop
	    %Map Selection, selects a certain map of the 3 depending on which one the user clicks, or a random one if the user clicks 'random'
	    Mouse.Where (mouseX, mouseY, mouseButton)
	    if mouseY > 394 and mouseY < 606 then
		if mouseX > 131 and mouseX < 467 then
		    Pic.Draw (mapSelect1, 0, 0, 0)
		    if mouseButton = 1 then
			randomMap := 1
			exit
		    end if
		elsif mouseX > 583 and mouseX < 919 then
		    Pic.Draw (mapSelect2, 0, 0, 0)
		    if mouseButton = 1 then
			randomMap := 2
			exit
		    end if
		elsif mouseX > 1033 and mouseX < 1370 then
		    Pic.Draw (mapSelect3, 0, 0, 0)
		    if mouseButton = 1 then
			randomMap := 3
			exit
		    end if
		end if
	    else
		Pic.Draw (mapSelect0, 0, 0, 0)
	    end if
	    Draw.Text ("Back", 10, 940, healthFont, white)
	    Draw.Text ("Random", 1200, 940, healthFont, white)
	    %Exit if the user clicks the exit button
	    if mouseX >= 10 and mouseX <= 160 and mouseY >= 940 and mouseY <= 982 and mouseButton = 1 then
		exitCondition := 1
		exit
		%Randomly pick a map if user clicks the random button
	    elsif mouseX >= 1200 and mouseX <= 1490 and mouseY >= 940 and mouseY <= 982 and mouseButton = 1 then
		randint (randomMap, 1, 3)
		exit
	    end if
	    delay (100)
	end loop
	loop
	    exit when exitCondition = 1
	    %Draw the game background
	    if randomMap = 1 then
		Pic.Draw (background, 0, 0, 0)
		textColour := 31
	    elsif randomMap = 2 then
		Pic.Draw (background3, 0, 0, 0)
		textColour := 7
	    elsif randomMap = 3 then
		Pic.Draw (background2, 0, 0, 0)
		textColour := 31
	    end if
	    %Get Keyboard Input
	    Input.KeyDown (input)
	    %If you press W, the tank goes up
	    if input ('w') then
		tank1Y := tank1Y + tank1Speed
		position1 := 1
		if tankAutoTurn = "Yes" then
		    direction1 := 0
		end if
		%If you press A, the tank goes left
	    elsif input ('a') then
		tank1X := tank1X - tank1Speed
		position1 := 2
		if tankAutoTurn = "Yes" then
		    direction1 := 6
		end if
		%If you press S, the tank goes down
	    elsif input ('s') then
		tank1Y := tank1Y - tank1Speed
		position1 := 3
		if tankAutoTurn = "Yes" then
		    direction1 := 4
		end if
		%If you press D, the tank goes right
	    elsif input ('d') then
		tank1X := tank1X + tank1Speed
		position1 := 4
		if tankAutoTurn = "Yes" then
		    direction1 := 2
		end if
	    end if
	    %Get Another Keyboard Input
	    Input.KeyDown (input)
	    %If you press 8, the tank goes up
	    if input ('8') then
		tank2Y := tank2Y + tank2Speed
		position2 := 1
		if tankAutoTurn = "Yes" then
		    direction2 := 0
		end if
		%If you press 4, the tank goes left
	    elsif input ('4') then
		tank2X := tank2X - tank2Speed
		position2 := 2
		if tankAutoTurn = "Yes" then
		    direction2 := 6
		end if
		%If you press 5, the tank goes down
	    elsif input ('5') then
		tank2Y := tank2Y - tank2Speed
		position2 := 3
		if tankAutoTurn = "Yes" then
		    direction2 := 4
		end if
		%If you press 6, the tank goes right
	    elsif input ('6') then
		tank2X := tank2X + tank2Speed
		position2 := 4
		if tankAutoTurn = "Yes" then
		    direction2 := 2
		end if
	    end if
	    %Get another keyboard input
	    Input.KeyDown (input)
	    %If q is pressed, rotate the cannon to the right
	    if input ('q') and spinTimer1 >= 100 then
		direction1 := direction1 - 1
		spinTimer1 := 0
		%If e is pressed, rotate the cannon to the left
	    elsif input ('e') and spinTimer1 >= 100 then
		direction1 := direction1 + 1
		spinTimer1 := 0
	    end if

	    Input.KeyDown (input)
	    %If 7 is pressed, rotate the cannon to the left
	    if input ('7') and spinTimer2 >= 100 then
		direction2 := direction2 - 1
		spinTimer2 := 0
		%If 9 is pressed, rotate the cannon to the right
	    elsif input ('9') and spinTimer2 >= 100 then
		direction2 := direction2 + 1
		spinTimer2 := 0
	    end if
	    %Code to make sure the tank can do a full loop (If it hits the farthest left value, change it to the closest right value)
	    if direction1 < 0 then
		direction1 := 7
	    elsif direction1 > 7 then
		direction1 := 0
	    end if
	    if direction2 < 0 then
		direction2 := 7
	    elsif direction2 > 7 then
		direction2 := 0
	    end if
	    %Bullets
	    %Get another keyboard input
	    Input.KeyDown (input)
	    %If you press the fire button and the bullet isn't already in midair then draw and shoot the bullet
	    if input (' ') and bullet1Midair >= 8 and bulletTimer1 >= 500 then
		drawBullet1 := 1
		bulletTimer1 := 0
	    end if
	    %Get another keyboard input
	    Input.KeyDown (input)
	    %If you press the fire button and the bullet isn't already in midair then draw and shoot the bullet
	    if input ('0') and bullet2Midair >= 8 and bulletTimer2 >= 500 then
		drawBullet2 := 1
		bulletTimer2 := 0
	    end if
	    %Mines
	    %Get another keyboard input
	    Input.KeyDown (input)
	    %if you press the mine key and your previous one has already blown up, lay another one where your tank is
	    if input (KEY_ENTER) and mineTimer2 = 0 then
		mine2X := tank2X - 38
		mine2Y := tank2Y - 38
		drawMine2 := 1
	    end if
	    Input.KeyDown (input)
	    %if you press the mine key and your previous one has already blown up, lay another one where your tank is
	    if input (KEY_SHIFT) and mineTimer1 = 0 then
		mine1X := tank1X - 38
		mine1Y := tank1Y - 38
		drawMine1 := 1
	    end if
	    %Setting variables for the side of the tank (changes depending on which way the tank is facing) (for collision)
	    if position1 = 1 then
		tank1top := tank1Y + 52
		tank1bottom := tank1Y - 55
		tank1side1 := tank1X - 38
		tank1side2 := tank1X + 38
	    elsif position1 = 2 then
		tank1top := tank1Y + 38
		tank1bottom := tank1Y - 38
		tank1side1 := tank1X - 52
		tank1side2 := tank1X + 55
	    elsif position1 = 3 then
		tank1top := tank1Y + 55
		tank1bottom := tank1Y - 52
		tank1side1 := tank1X - 38
		tank1side2 := tank1X + 38
	    elsif position1 = 4 then
		tank1top := tank1Y + 38
		tank1bottom := tank1Y - 38
		tank1side1 := tank1X - 55
		tank1side2 := tank1X + 52
	    end if
	    if position2 = 1 then
		tank2top := tank2Y + 52
		tank2bottom := tank2Y - 55
		tank2side1 := tank2X - 38
		tank2side2 := tank2X + 38
	    elsif position2 = 2 then
		tank2top := tank2Y + 38
		tank2bottom := tank2Y - 38
		tank2side1 := tank2X - 52
		tank2side2 := tank2X + 55
	    elsif position2 = 3 then
		tank2top := tank2Y + 55
		tank2bottom := tank2Y - 52
		tank2side1 := tank2X - 38
		tank2side2 := tank2X + 38
	    elsif position2 = 4 then
		tank2top := tank2Y + 38
		tank2bottom := tank2Y - 38
		tank2side1 := tank2X - 55
		tank2side2 := tank2X + 52
	    end if
	    %Power Ups
	    %If you have enabled power ups and there isn't already a power up on the field, generate a random location and place it there
	    if enablePowerUp = "Yes" then
		if powerUpTimer = powerUpSpawnTime div 50 * 50 then
		    randint (powerUpPos, 1, 7)
		    randint (powerUpType, 1, 4)
		    drawPowerUp := 1
		    %Reset your current power up to prevent stacking power ups
		    bullet1Damage := bullet1DamageConst
		    tank1Speed := tank1SpeedConst
		    bullet2Damage := bullet2DamageConst
		    tank2Speed := tank2SpeedConst
		end if
	    end if
	    % TANK 1 COLLISION - If your tank is 'inside' the wall, reset your value to be back 'outside' the wall
	    %Collision - Border
	    if position1 = 2 and tank1X - 52 <= 0 and tank1Y - 38 >= 355 and tank1Y + 38 <= 545 then
		tank1X := 52
	    elsif position1 = 1 and tank1Y + 52 >= 545 and tank1X - 38 >= 0 and tank1X - 38 <= 25 then
		tank1Y := 493
	    elsif position1 = 3 and tank1Y - 52 <= 355 and tank1X - 38 >= 0 and tank1X - 38 <= 25 then
		tank1Y := 407
	    elsif position1 = 2 and tank1X - 52 <= 25 and tank1Y + 38 >= 545 and tank1Y + 38 <= 875 then
		tank1X := 77
	    elsif position1 = 2 and tank1X - 52 <= 25 and tank1Y - 38 <= 355 and tank1Y - 38 >= 25 then
		tank1X := 77
	    elsif position1 = 1 and tank1Y + 52 >= 875 and tank1X - 38 >= 25 and tank1X + 38 <= 1475 then
		tank1Y := 823
	    elsif position1 = 3 and tank1Y - 52 <= 25 and tank1X - 38 >= 25 and tank1X + 38 <= 1475 then
		tank1Y := 77
	    elsif position1 = 4 and tank1X + 52 >= 1475 and tank1Y + 38 >= 545 and tank1Y + 38 <= 875 then
		tank1X := 1423
	    elsif position1 = 4 and tank1X + 52 >= 1475 and tank1Y - 38 >= 25 and tank1Y - 38 <= 355 then
		tank1X := 1423
	    elsif position1 = 4 and tank1X + 52 >= 1500 and tank1Y - 38 >= 355 and tank1Y + 38 <= 545 then
		tank1X := 1448
	    elsif position1 = 1 and tank1Y + 52 >= 545 and tank1X + 38 <= 1500 and tank1X + 38 >= 1475 then
		tank1Y := 493
	    elsif position1 = 3 and tank1Y - 52 <= 355 and tank1X + 38 <= 1500 and tank1X + 38 >= 1475 then
		tank1Y := 407
	    end if
	    %Collision - Left BigWall
	    if randomMap = 1 then
		if position1 = 4 and tank1X + 52 >= 172 and tank1X + 52 <= 183 and tank1Y - 38 <= 700 and tank1Y - 38 >= 200 then
		    tank1X := 120
		elsif position1 = 4 and tank1X + 52 >= 172 and tank1X + 52 <= 183 and tank1Y + 38 <= 700 and tank1Y + 38 >= 200 then
		    tank1X := 120
		elsif position1 = 1 and tank1Y + 52 >= 200 and tank1Y + 52 <= 250 and tank1X - 38 >= 172 and tank1X - 38 <= 223 then
		    tank1Y := 148
		elsif position1 = 1 and tank1Y + 52 >= 200 and tank1Y + 52 <= 250 and tank1X + 38 >= 172 and tank1X + 38 <= 223 then
		    tank1Y := 148
		elsif position1 = 1 and tank1Y + 52 >= 200 and tank1Y + 52 <= 250 and tank1X >= 172 and tank1X <= 223 then
		    tank1Y := 148
		elsif position1 = 3 and tank1Y - 52 <= 700 and tank1Y - 52 >= 650 and tank1X - 38 >= 172 and tank1X - 38 <= 223 then
		    tank1Y := 752
		elsif position1 = 3 and tank1Y - 52 <= 700 and tank1Y - 52 >= 650 and tank1X + 38 >= 172 and tank1X + 38 <= 223 then
		    tank1Y := 752
		elsif position1 = 3 and tank1Y - 52 <= 700 and tank1Y - 52 >= 650 and tank1X >= 172 and tank1X <= 223 then
		    tank1Y := 752
		elsif position1 = 2 and tank1X - 52 <= 223 and tank1X - 52 >= 213 and tank1Y - 38 <= 700 and tank1Y - 38 >= 475 then
		    tank1X := 275
		elsif position1 = 2 and tank1X - 52 <= 223 and tank1X - 52 >= 213 and tank1Y + 38 <= 700 and tank1Y + 38 >= 475 then
		    tank1X := 275
		elsif position1 = 2 and tank1X - 52 <= 223 and tank1X - 52 >= 213 and tank1Y - 38 <= 425 and tank1Y - 38 >= 200 then
		    tank1X := 275
		elsif position1 = 2 and tank1X - 52 <= 223 and tank1X - 52 >= 213 and tank1Y + 38 <= 425 and tank1Y + 38 >= 200 then
		    tank1X := 275
		elsif position1 = 3 and tank1Y - 52 <= 475 and tank1Y - 52 >= 455 and tank1X - 38 >= 223 and tank1X - 38 <= 323 then
		    tank1Y := 527
		elsif position1 = 3 and tank1Y - 52 <= 475 and tank1Y - 52 >= 455 and tank1X + 38 >= 223 and tank1X + 38 <= 323 then
		    tank1Y := 527
		elsif position1 = 1 and tank1Y + 52 >= 425 and tank1Y + 52 <= 435 and tank1X - 38 >= 223 and tank1X - 38 <= 323 then
		    tank1Y := 373
		elsif position1 = 1 and tank1Y + 52 >= 425 and tank1Y + 52 <= 435 and tank1X + 38 >= 223 and tank1X + 38 <= 323 then
		    tank1Y := 373
		elsif position1 = 2 and tank1X - 52 <= 323 and tank1X - 52 >= 273 and tank1Y - 38 <= 475 and tank1Y - 38 >= 425 then
		    tank1X := 375
		elsif position1 = 2 and tank1X - 52 <= 323 and tank1X - 52 >= 273 and tank1Y + 38 <= 475 and tank1Y + 38 >= 425 then
		    tank1X := 375
		elsif position1 = 2 and tank1X - 52 <= 323 and tank1X - 52 >= 273 and tank1Y <= 475 and tank1Y >= 425 then
		    tank1X := 375
		end if
	    end if
	    %Collision - Topleft L Wall
	    if randomMap = 1 or randomMap = 2 then
		if position1 = 4 and tank1X + 52 >= 374 and tank1X + 52 <= 424 and tank1Y - 38 <= 700 and tank1Y - 38 >= 650 then
		    tank1X := 322
		elsif position1 = 4 and tank1X + 52 >= 374 and tank1X + 52 <= 424 and tank1Y + 38 <= 700 and tank1Y + 38 >= 650 then
		    tank1X := 322
		elsif position1 = 4 and tank1X + 52 >= 374 and tank1X + 52 <= 424 and tank1Y <= 700 and tank1Y >= 650 then
		    tank1X := 322
		elsif position1 = 4 and tank1X + 52 >= 450 and tank1X + 52 <= 470 and tank1Y - 38 <= 850 and tank1Y - 38 >= 700 then
		    tank1X := 398
		elsif position1 = 4 and tank1X + 52 >= 450 and tank1X + 52 <= 470 and tank1Y + 38 <= 850 and tank1Y + 38 >= 700 then
		    tank1X := 398
		elsif position1 = 3 and tank1Y - 52 <= 700 and tank1Y - 52 >= 680 and tank1X - 38 >= 374 and tank1X - 38 <= 450 then
		    tank1Y := 752
		elsif position1 = 3 and tank1Y - 52 <= 700 and tank1Y - 52 >= 680 and tank1X + 38 >= 374 and tank1X + 38 <= 450 then
		    tank1Y := 752
		elsif position1 = 1 and tank1Y + 52 >= 650 and tank1Y + 52 <= 670 and tank1X - 38 >= 374 and tank1X - 38 <= 500 then
		    tank1Y := 598
		elsif position1 = 1 and tank1Y + 52 >= 650 and tank1Y + 52 <= 670 and tank1X + 38 >= 374 and tank1X + 38 <= 500 then
		    tank1Y := 598
		elsif position1 = 2 and tank1X - 52 <= 500 and tank1X - 52 >= 480 and tank1Y - 38 <= 850 and tank1Y - 38 >= 650 then
		    tank1X := 552
		elsif position1 = 2 and tank1X - 52 <= 500 and tank1X - 52 >= 480 and tank1Y + 38 <= 850 and tank1Y + 38 >= 650 then
		    tank1X := 552
		end if
	    end if
	    %Collision - Left Middle Block
	    if position1 = 4 and tank1X + 52 >= 526 and tank1X + 52 <= 546 and tank1Y - 38 <= 550 and tank1Y - 38 >= 350 then
		tank1X := 474
	    elsif position1 = 4 and tank1X + 52 >= 526 and tank1X + 52 <= 546 and tank1Y + 38 <= 550 and tank1Y + 38 >= 350 then
		tank1X := 474
	    elsif position1 = 2 and tank1X - 52 <= 576 and tank1X - 52 >= 556 and tank1Y - 38 <= 550 and tank1Y - 38 >= 350 then
		tank1X := 628
	    elsif position1 = 2 and tank1X - 52 <= 576 and tank1X - 52 >= 556 and tank1Y + 38 <= 550 and tank1Y + 38 >= 350 then
		tank1X := 628
	    elsif position1 = 1 and tank1Y + 52 >= 350 and tank1Y + 52 <= 370 and tank1X - 38 >= 526 and tank1X - 38 <= 576 then
		tank1Y := 298
	    elsif position1 = 1 and tank1Y + 52 >= 350 and tank1Y + 52 <= 370 and tank1X + 38 >= 526 and tank1X + 38 <= 576 then
		tank1Y := 298
	    elsif position1 = 1 and tank1Y + 52 >= 350 and tank1Y + 52 <= 370 and tank1X >= 526 and tank1X <= 576 then
		tank1Y := 298
	    elsif position1 = 3 and tank1Y - 52 <= 550 and tank1Y - 52 >= 530 and tank1X - 38 >= 526 and tank1X - 38 <= 576 then
		tank1Y := 602
	    elsif position1 = 3 and tank1Y - 52 <= 550 and tank1Y - 52 >= 530 and tank1X + 38 >= 526 and tank1X + 38 <= 576 then
		tank1Y := 602
	    elsif position1 = 3 and tank1Y - 52 <= 550 and tank1Y - 52 >= 530 and tank1X >= 526 and tank1X <= 576 then
		tank1Y := 602
	    end if
	    %Collision - BottomLeft L Wall
	    if randomMap = 1 or randomMap = 2 then
		if position1 = 4 and tank1X + 52 >= 450 and tank1X + 52 <= 470 and tank1Y - 38 <= 200 and tank1Y - 38 >= 50 then
		    tank1X := 398
		elsif position1 = 4 and tank1X + 52 >= 450 and tank1X + 52 <= 470 and tank1Y + 38 <= 200 and tank1Y + 38 >= 50 then
		    tank1X := 398
		elsif position1 = 4 and tank1X + 52 >= 374 and tank1X + 52 <= 424 and tank1Y - 38 <= 250 and tank1Y - 38 >= 200 then
		    tank1X := 322
		elsif position1 = 4 and tank1X + 52 >= 374 and tank1X + 52 <= 424 and tank1Y + 38 <= 250 and tank1Y + 38 >= 200 then
		    tank1X := 322
		elsif position1 = 4 and tank1X + 52 >= 374 and tank1X + 52 <= 424 and tank1Y <= 250 and tank1Y >= 200 then
		    tank1X := 322
		elsif position1 = 2 and tank1X - 52 <= 500 and tank1X - 52 >= 480 and tank1Y - 38 <= 250 and tank1Y - 38 >= 50 then
		    tank1X := 552
		elsif position1 = 2 and tank1X - 52 <= 500 and tank1X - 52 >= 480 and tank1Y + 38 <= 250 and tank1Y + 38 >= 50 then
		    tank1X := 552
		elsif position1 = 3 and tank1Y - 52 <= 250 and tank1Y - 52 >= 230 and tank1X - 38 >= 374 and tank1X - 38 <= 500 then
		    tank1Y := 302
		elsif position1 = 3 and tank1Y - 52 <= 250 and tank1Y - 52 >= 230 and tank1X + 38 >= 374 and tank1X + 38 <= 500 then
		    tank1Y := 302
		elsif position1 = 1 and tank1Y + 52 >= 200 and tank1Y + 52 <= 220 and tank1X - 38 >= 374 and tank1X - 38 <= 450 then
		    tank1Y := 148
		elsif position1 = 1 and tank1Y + 52 >= 200 and tank1Y + 52 <= 220 and tank1X + 38 >= 374 and tank1X + 38 <= 450 then
		    tank1Y := 148
		end if
	    end if
	    %Collision - Right Middle Block
	    if position1 = 4 and tank1X + 52 >= 922 and tank1X + 52 <= 942 and tank1Y - 38 <= 550 and tank1Y - 38 >= 350 then
		tank1X := 870
	    elsif position1 = 4 and tank1X + 52 >= 922 and tank1X + 52 <= 942 and tank1Y + 38 <= 550 and tank1Y + 38 >= 350 then
		tank1X := 870
	    elsif position1 = 2 and tank1X - 52 <= 973 and tank1X - 52 >= 953 and tank1Y - 38 <= 550 and tank1Y - 38 >= 350 then
		tank1X := 1025
	    elsif position1 = 2 and tank1X - 52 <= 973 and tank1X - 52 >= 953 and tank1Y + 38 <= 550 and tank1Y + 38 >= 350 then
		tank1X := 1025
	    elsif position1 = 1 and tank1Y + 52 >= 350 and tank1Y + 52 <= 370 and tank1X - 38 >= 922 and tank1X - 38 <= 973 then
		tank1Y := 298
	    elsif position1 = 1 and tank1Y + 52 >= 350 and tank1Y + 52 <= 370 and tank1X + 38 >= 922 and tank1X + 38 <= 973 then
		tank1Y := 298
	    elsif position1 = 1 and tank1Y + 52 >= 350 and tank1Y + 52 <= 370 and tank1X >= 922 and tank1X <= 973 then
		tank1Y := 298
	    elsif position1 = 3 and tank1Y - 52 <= 550 and tank1Y - 52 >= 530 and tank1X - 38 >= 922 and tank1X - 38 <= 973 then
		tank1Y := 602
	    elsif position1 = 3 and tank1Y - 52 <= 550 and tank1Y - 52 >= 530 and tank1X + 38 >= 922 and tank1X + 38 <= 973 then
		tank1Y := 602
	    elsif position1 = 3 and tank1Y - 52 <= 550 and tank1Y - 52 >= 530 and tank1X >= 922 and tank1X <= 973 then
		tank1Y := 602
	    end if
	    %Collision - TopRight L Wall
	    if randomMap = 1 or randomMap = 2 then
		if position1 = 4 and tank1X + 52 <= 1019 and tank1X + 52 >= 999 and tank1Y - 38 <= 850 and tank1Y - 38 >= 650 then
		    tank1X := 947
		elsif position1 = 4 and tank1X + 52 <= 1019 and tank1X + 52 >= 999 and tank1Y + 38 <= 850 and tank1Y + 38 >= 650 then
		    tank1X := 947
		elsif position1 = 1 and tank1Y + 52 >= 650 and tank1Y + 52 <= 670 and tank1X + 38 >= 999 and tank1X + 38 <= 1125 then
		    tank1Y := 598
		elsif position1 = 1 and tank1Y + 52 >= 650 and tank1Y + 52 <= 670 and tank1X - 38 >= 999 and tank1X - 38 <= 1125 then
		    tank1Y := 598
		elsif position1 = 2 and tank1X - 52 <= 1050 and tank1X - 52 >= 1030 and tank1Y + 38 <= 850 and tank1Y + 38 >= 700 then
		    tank1X := 1102
		elsif position1 = 2 and tank1X - 52 <= 1050 and tank1X - 52 >= 1030 and tank1Y - 38 <= 850 and tank1Y - 38 >= 700 then
		    tank1X := 1102
		elsif position1 = 2 and tank1X - 52 <= 1126 and tank1X - 52 >= 1076 and tank1Y - 38 <= 699 and tank1Y - 38 >= 648 then
		    tank1X := 1178
		elsif position1 = 2 and tank1X - 52 <= 1126 and tank1X - 52 >= 1076 and tank1Y + 38 <= 699 and tank1Y + 38 >= 648 then
		    tank1X := 1178
		elsif position1 = 2 and tank1X - 52 <= 1126 and tank1X - 52 >= 1076 and tank1Y <= 699 and tank1Y >= 648 then
		    tank1X := 1178
		elsif position1 = 3 and tank1Y - 52 <= 700 and tank1Y - 52 >= 680 and tank1X + 38 >= 1050 and tank1X + 38 <= 1125 then
		    tank1Y := 752
		elsif position1 = 3 and tank1Y - 52 <= 700 and tank1Y - 52 >= 680 and tank1X - 38 >= 1050 and tank1X - 38 <= 1125 then
		    tank1Y := 752
		end if
	    end if
	    %Collision - BottomRight L Wall
	    if randomMap = 1 or randomMap = 2 then
		if position1 = 4 and tank1X + 52 <= 1019 and tank1X + 52 >= 999 and tank1Y - 38 <= 250 and tank1Y - 38 >= 50 then
		    tank1X := 947
		elsif position1 = 4 and tank1X + 52 <= 1019 and tank1X + 52 >= 999 and tank1Y + 38 <= 250 and tank1Y + 38 >= 50 then
		    tank1X := 947
		elsif position1 = 3 and tank1Y - 52 <= 250 and tank1Y - 52 >= 230 and tank1X + 38 >= 999 and tank1X + 38 <= 1125 then
		    tank1Y := 302
		elsif position1 = 3 and tank1Y - 52 <= 250 and tank1Y - 52 >= 230 and tank1X - 38 >= 999 and tank1X - 38 <= 1125 then
		    tank1Y := 302
		elsif position1 = 1 and tank1Y + 52 >= 200 and tank1Y + 52 <= 220 and tank1X - 38 >= 1050 and tank1X - 38 <= 1125 then
		    tank1Y := 148
		elsif position1 = 1 and tank1Y + 52 >= 200 and tank1Y + 52 <= 220 and tank1X + 38 >= 1050 and tank1X + 38 <= 1125 then
		    tank1Y := 148
		elsif position1 = 2 and tank1X - 52 <= 1126 and tank1X - 52 >= 1076 and tank1Y - 38 <= 250 and tank1Y - 38 >= 200 then
		    tank1X := 1178
		elsif position1 = 2 and tank1X - 52 <= 1126 and tank1X - 52 >= 1076 and tank1Y + 38 <= 250 and tank1Y + 38 >= 200 then
		    tank1X := 1178
		elsif position1 = 2 and tank1X - 52 <= 1126 and tank1X - 52 >= 1076 and tank1Y <= 250 and tank1Y >= 200 then
		    tank1X := 1178
		elsif position1 = 2 and tank1X - 52 <= 1050 and tank1X - 52 >= 1030 and tank1Y <= 200 and tank1Y >= 50 then
		    tank1X := 1102
		end if
	    end if
	    %Collision - Right BigWall
	    if randomMap = 1 then
		if position1 = 2 and tank1X - 52 <= 1326 and tank1X - 52 >= 1306 and tank1Y - 38 <= 700 and tank1Y - 38 >= 200 then
		    tank1X := 1378
		elsif position1 = 2 and tank1X - 52 <= 1326 and tank1X - 52 >= 1306 and tank1Y + 38 <= 700 and tank1Y + 38 >= 200 then
		    tank1X := 1378
		elsif position1 = 3 and tank1Y - 52 <= 700 and tank1Y - 52 >= 650 and tank1X - 38 >= 1275 and tank1X - 38 <= 1325 then
		    tank1Y := 752
		elsif position1 = 3 and tank1Y - 52 <= 700 and tank1Y - 52 >= 650 and tank1X + 38 >= 1275 and tank1X + 38 <= 1325 then
		    tank1Y := 752
		elsif position1 = 3 and tank1Y - 52 <= 700 and tank1Y - 52 >= 650 and tank1X >= 1275 and tank1X <= 1325 then
		    tank1Y := 752
		elsif position1 = 1 and tank1Y + 52 >= 200 and tank1Y + 52 <= 250 and tank1X + 38 >= 1275 and tank1X + 38 <= 1325 then
		    tank1Y := 148
		elsif position1 = 1 and tank1Y + 52 >= 200 and tank1Y + 52 <= 250 and tank1X - 38 >= 1275 and tank1X - 38 <= 1325 then
		    tank1Y := 148
		elsif position1 = 1 and tank1Y + 52 >= 200 and tank1Y + 52 <= 250 and tank1X >= 1275 and tank1X <= 1325 then
		    tank1Y := 148
		elsif position1 = 4 and tank1X + 52 >= 1275 and tank1X + 52 <= 1325 and tank1Y + 38 <= 425 and tank1Y + 38 >= 200 then
		    tank1X := 1223
		elsif position1 = 4 and tank1X + 52 >= 1275 and tank1X + 52 <= 1325 and tank1Y - 38 <= 425 and tank1Y - 38 >= 200 then
		    tank1X := 1223
		elsif position1 = 4 and tank1X + 52 >= 1275 and tank1X + 52 <= 1325 and tank1Y - 38 <= 700 and tank1Y - 38 >= 475 then
		    tank1X := 1223
		elsif position1 = 4 and tank1X + 52 >= 1275 and tank1X + 52 <= 1325 and tank1Y + 38 <= 700 and tank1Y + 38 >= 475 then
		    tank1X := 1223
		elsif position1 = 4 and tank1X + 52 >= 1175 and tank1X + 52 <= 1225 and tank1Y + 38 <= 475 and tank1Y + 38 >= 425 then
		    tank1X := 1123
		elsif position1 = 4 and tank1X + 52 >= 1175 and tank1X + 52 <= 1225 and tank1Y - 38 <= 475 and tank1Y - 38 >= 425 then
		    tank1X := 1123
		elsif position1 = 4 and tank1X + 52 >= 1175 and tank1X + 52 <= 1225 and tank1Y <= 475 and tank1Y >= 425 then
		    tank1X := 1123
		elsif position1 = 1 and tank1Y + 52 >= 425 and tank1Y + 52 <= 445 and tank1X + 38 >= 1175 and tank1X + 38 <= 1275 then
		    tank1Y := 373
		elsif position1 = 1 and tank1Y + 52 >= 425 and tank1Y + 52 <= 445 and tank1X - 38 >= 1175 and tank1X - 38 <= 1275 then
		    tank1Y := 373
		elsif position1 = 3 and tank1Y - 52 <= 475 and tank1Y - 52 >= 455 and tank1X + 38 >= 1175 and tank1X + 38 <= 1275 then
		    tank1Y := 527
		elsif position1 = 3 and tank1Y - 52 <= 475 and tank1Y - 52 >= 455 and tank1X - 38 >= 1175 and tank1X - 38 <= 1275 then
		    tank1Y := 527
		end if
	    end if
	    % TANK 2 COLLISION - If your tank is 'inside' the wall, reset your value to be back 'outside' the wall
	    if position2 = 2 and tank2X - 52 <= 0 and tank2Y - 38 >= 355 and tank2Y + 38 <= 545 then
		tank2X := 52
	    elsif position2 = 1 and tank2Y + 52 >= 545 and tank2X - 38 >= 0 and tank2X - 38 <= 25 then
		tank2Y := 493
	    elsif position2 = 3 and tank2Y - 52 <= 355 and tank2X - 38 >= 0 and tank2X - 38 <= 25 then
		tank2Y := 407
	    elsif position2 = 2 and tank2X - 52 <= 25 and tank2Y + 38 >= 545 and tank2Y + 38 <= 875 then
		tank2X := 77
	    elsif position2 = 2 and tank2X - 52 <= 25 and tank2Y - 38 <= 355 and tank2Y - 38 >= 25 then
		tank2X := 77
	    elsif position2 = 1 and tank2Y + 52 >= 875 and tank2X - 38 >= 25 and tank2X + 38 <= 1475 then
		tank2Y := 823
	    elsif position2 = 3 and tank2Y - 52 <= 25 and tank2X - 38 >= 25 and tank2X + 38 <= 1475 then
		tank2Y := 77
	    elsif position2 = 4 and tank2X + 52 >= 1475 and tank2Y + 38 >= 545 and tank2Y + 38 <= 875 then
		tank2X := 1423
	    elsif position2 = 4 and tank2X + 52 >= 1475 and tank2Y - 38 >= 25 and tank2Y - 38 <= 355 then
		tank2X := 1423
	    elsif position2 = 4 and tank2X + 52 >= 1500 and tank2Y - 38 >= 355 and tank2Y + 38 <= 545 then
		tank2X := 1448
	    elsif position2 = 1 and tank2Y + 52 >= 545 and tank2X + 38 <= 1500 and tank2X + 38 >= 1475 then
		tank2Y := 493
	    elsif position2 = 3 and tank2Y - 52 <= 355 and tank2X + 38 <= 1500 and tank2X + 38 >= 1475 then
		tank2Y := 407
	    end if
	    %Collision - Left BigWall
	    if randomMap = 1 then
		if position2 = 4 and tank2X + 52 >= 172 and tank2X + 52 <= 183 and tank2Y - 38 <= 700 and tank2Y - 38 >= 200 then
		    tank2X := 120
		elsif position2 = 4 and tank2X + 52 >= 172 and tank2X + 52 <= 183 and tank2Y + 38 <= 700 and tank2Y + 38 >= 200 then
		    tank2X := 120
		elsif position2 = 1 and tank2Y + 52 >= 200 and tank2Y + 52 <= 250 and tank2X - 38 >= 172 and tank2X - 38 <= 223 then
		    tank2Y := 148
		elsif position2 = 1 and tank2Y + 52 >= 200 and tank2Y + 52 <= 250 and tank2X + 38 >= 172 and tank2X + 38 <= 223 then
		    tank2Y := 148
		elsif position2 = 1 and tank2Y + 52 >= 200 and tank2Y + 52 <= 250 and tank2X >= 172 and tank2X <= 223 then
		    tank2Y := 148
		elsif position2 = 3 and tank2Y - 52 <= 700 and tank2Y - 52 >= 650 and tank2X - 38 >= 172 and tank2X - 38 <= 223 then
		    tank2Y := 752
		elsif position2 = 3 and tank2Y - 52 <= 700 and tank2Y - 52 >= 650 and tank2X + 38 >= 172 and tank2X + 38 <= 223 then
		    tank2Y := 752
		elsif position2 = 3 and tank2Y - 52 <= 700 and tank2Y - 52 >= 650 and tank2X >= 172 and tank2X <= 223 then
		    tank2Y := 752
		elsif position2 = 2 and tank2X - 52 <= 223 and tank2X - 52 >= 213 and tank2Y - 38 <= 700 and tank2Y - 38 >= 475 then
		    tank2X := 275
		elsif position2 = 2 and tank2X - 52 <= 223 and tank2X - 52 >= 213 and tank2Y + 38 <= 700 and tank2Y + 38 >= 475 then
		    tank2X := 275
		elsif position2 = 2 and tank2X - 52 <= 223 and tank2X - 52 >= 213 and tank2Y - 38 <= 425 and tank2Y - 38 >= 200 then
		    tank2X := 275
		elsif position2 = 2 and tank2X - 52 <= 223 and tank2X - 52 >= 213 and tank2Y + 38 <= 425 and tank2Y + 38 >= 200 then
		    tank2X := 275
		elsif position2 = 3 and tank2Y - 52 <= 475 and tank2Y - 52 >= 455 and tank2X - 38 >= 223 and tank2X - 38 <= 323 then
		    tank2Y := 527
		elsif position2 = 3 and tank2Y - 52 <= 475 and tank2Y - 52 >= 455 and tank2X + 38 >= 223 and tank2X + 38 <= 323 then
		    tank2Y := 527
		elsif position2 = 1 and tank2Y + 52 >= 425 and tank2Y + 52 <= 435 and tank2X - 38 >= 223 and tank2X - 38 <= 323 then
		    tank2Y := 373
		elsif position2 = 1 and tank2Y + 52 >= 425 and tank2Y + 52 <= 435 and tank2X + 38 >= 223 and tank2X + 38 <= 323 then
		    tank2Y := 373
		elsif position2 = 2 and tank2X - 52 <= 323 and tank2X - 52 >= 273 and tank2Y - 38 <= 475 and tank2Y - 38 >= 425 then
		    tank2X := 375
		elsif position2 = 2 and tank2X - 52 <= 323 and tank2X - 52 >= 273 and tank2Y + 38 <= 475 and tank2Y + 38 >= 425 then
		    tank2X := 375
		elsif position2 = 2 and tank2X - 52 <= 323 and tank2X - 52 >= 273 and tank2Y <= 475 and tank2Y >= 425 then
		    tank2X := 375
		end if
	    end if
	    %Collision - Topleft L Wall
	    if randomMap = 1 or randomMap = 2 then
		if position2 = 4 and tank2X + 52 >= 374 and tank2X + 52 <= 424 and tank2Y - 38 <= 700 and tank2Y - 38 >= 650 then
		    tank2X := 322
		elsif position2 = 4 and tank2X + 52 >= 374 and tank2X + 52 <= 424 and tank2Y + 38 <= 700 and tank2Y + 38 >= 650 then
		    tank2X := 322
		elsif position2 = 4 and tank2X + 52 >= 374 and tank2X + 52 <= 424 and tank2Y <= 700 and tank2Y >= 650 then
		    tank2X := 322
		elsif position2 = 4 and tank2X + 52 >= 450 and tank2X + 52 <= 470 and tank2Y - 38 <= 850 and tank2Y - 38 >= 700 then
		    tank2X := 398
		elsif position2 = 4 and tank2X + 52 >= 450 and tank2X + 52 <= 470 and tank2Y + 38 <= 850 and tank2Y + 38 >= 700 then
		    tank2X := 398
		elsif position2 = 3 and tank2Y - 52 <= 700 and tank2Y - 52 >= 680 and tank2X - 38 >= 374 and tank2X - 38 <= 450 then
		    tank2Y := 752
		elsif position2 = 3 and tank2Y - 52 <= 700 and tank2Y - 52 >= 680 and tank2X + 38 >= 374 and tank2X + 38 <= 450 then
		    tank2Y := 752
		elsif position2 = 1 and tank2Y + 52 >= 650 and tank2Y + 52 <= 670 and tank2X - 38 >= 374 and tank2X - 38 <= 500 then
		    tank2Y := 598
		elsif position2 = 1 and tank2Y + 52 >= 650 and tank2Y + 52 <= 670 and tank2X + 38 >= 374 and tank2X + 38 <= 500 then
		    tank2Y := 598
		elsif position2 = 2 and tank2X - 52 <= 500 and tank2X - 52 >= 480 and tank2Y - 38 <= 850 and tank2Y - 38 >= 650 then
		    tank2X := 552
		elsif position2 = 2 and tank2X - 52 <= 500 and tank2X - 52 >= 480 and tank2Y + 38 <= 850 and tank2Y + 38 >= 650 then
		    tank2X := 552
		end if
	    end if
	    %Collision - Left Middle Block
	    if position2 = 4 and tank2X + 52 >= 526 and tank2X + 52 <= 546 and tank2Y - 38 <= 550 and tank2Y - 38 >= 350 then
		tank2X := 474
	    elsif position2 = 4 and tank2X + 52 >= 526 and tank2X + 52 <= 546 and tank2Y + 38 <= 550 and tank2Y + 38 >= 350 then
		tank2X := 474
	    elsif position2 = 2 and tank2X - 52 <= 576 and tank2X - 52 >= 556 and tank2Y - 38 <= 550 and tank2Y - 38 >= 350 then
		tank2X := 628
	    elsif position2 = 2 and tank2X - 52 <= 576 and tank2X - 52 >= 556 and tank2Y + 38 <= 550 and tank2Y + 38 >= 350 then
		tank2X := 628
	    elsif position2 = 1 and tank2Y + 52 >= 350 and tank2Y + 52 <= 370 and tank2X - 38 >= 526 and tank2X - 38 <= 576 then
		tank2Y := 298
	    elsif position2 = 1 and tank2Y + 52 >= 350 and tank2Y + 52 <= 370 and tank2X + 38 >= 526 and tank2X + 38 <= 576 then
		tank2Y := 298
	    elsif position2 = 1 and tank2Y + 52 >= 350 and tank2Y + 52 <= 370 and tank2X >= 526 and tank2X <= 576 then
		tank2Y := 298
	    elsif position2 = 3 and tank2Y - 52 <= 550 and tank2Y - 52 >= 530 and tank2X - 38 >= 526 and tank2X - 38 <= 576 then
		tank2Y := 602
	    elsif position2 = 3 and tank2Y - 52 <= 550 and tank2Y - 52 >= 530 and tank2X + 38 >= 526 and tank2X + 38 <= 576 then
		tank2Y := 602
	    elsif position2 = 3 and tank2Y - 52 <= 550 and tank2Y - 52 >= 530 and tank2X >= 526 and tank2X <= 576 then
		tank2Y := 602
	    end if
	    %Collision - BottomLeft L Wall
	    if randomMap = 1 or randomMap = 2 then
		if position2 = 4 and tank2X + 52 >= 450 and tank2X + 52 <= 470 and tank2Y - 38 <= 200 and tank2Y - 38 >= 50 then
		    tank2X := 398
		elsif position2 = 4 and tank2X + 52 >= 450 and tank2X + 52 <= 470 and tank2Y + 38 <= 200 and tank2Y + 38 >= 50 then
		    tank2X := 398
		elsif position2 = 4 and tank2X + 52 >= 374 and tank2X + 52 <= 424 and tank2Y - 38 <= 250 and tank2Y - 38 >= 200 then
		    tank2X := 322
		elsif position2 = 4 and tank2X + 52 >= 374 and tank2X + 52 <= 424 and tank2Y + 38 <= 250 and tank2Y + 38 >= 200 then
		    tank2X := 322
		elsif position2 = 4 and tank2X + 52 >= 374 and tank2X + 52 <= 424 and tank2Y <= 250 and tank2Y >= 200 then
		    tank2X := 322
		end if
		if position2 = 2 and tank2X - 52 <= 500 and tank2X - 52 >= 480 and tank2Y - 38 <= 250 and tank2Y - 38 >= 50 then
		    tank2X := 552
		elsif position2 = 2 and tank2X - 52 <= 500 and tank2X - 52 >= 480 and tank2Y + 38 <= 250 and tank2Y + 38 >= 50 then
		    tank2X := 552
		elsif position2 = 3 and tank2Y - 52 <= 250 and tank2Y - 52 >= 230 and tank2X - 38 >= 374 and tank2X - 38 <= 500 then
		    tank2Y := 302
		elsif position2 = 3 and tank2Y - 52 <= 250 and tank2Y - 52 >= 230 and tank2X + 38 >= 374 and tank2X + 38 <= 500 then
		    tank2Y := 302
		elsif position2 = 1 and tank2Y + 52 >= 200 and tank2Y + 52 <= 220 and tank2X - 38 >= 374 and tank2X - 38 <= 450 then
		    tank2Y := 148
		elsif position2 = 1 and tank2Y + 52 >= 200 and tank2Y + 52 <= 220 and tank2X + 38 >= 374 and tank2X + 38 <= 450 then
		    tank2Y := 148
		end if
	    end if
	    %Collision - Right Middle Block
	    if position2 = 4 and tank2X + 52 >= 922 and tank2X + 52 <= 942 and tank2Y - 38 <= 550 and tank2Y - 38 >= 350 then
		tank2X := 870
	    elsif position2 = 4 and tank2X + 52 >= 922 and tank2X + 52 <= 942 and tank2Y + 38 <= 550 and tank2Y + 38 >= 350 then
		tank2X := 870
	    elsif position2 = 2 and tank2X - 52 <= 973 and tank2X - 52 >= 953 and tank2Y - 38 <= 550 and tank2Y - 38 >= 350 then
		tank2X := 1025
	    elsif position2 = 2 and tank2X - 52 <= 973 and tank2X - 52 >= 953 and tank2Y + 38 <= 550 and tank2Y + 38 >= 350 then
		tank2X := 1025
	    elsif position2 = 1 and tank2Y + 52 >= 350 and tank2Y + 52 <= 370 and tank2X - 38 >= 922 and tank2X - 38 <= 973 then
		tank2Y := 298
	    elsif position2 = 1 and tank2Y + 52 >= 350 and tank2Y + 52 <= 370 and tank2X + 38 >= 922 and tank2X + 38 <= 973 then
		tank2Y := 298
	    elsif position2 = 1 and tank2Y + 52 >= 350 and tank2Y + 52 <= 370 and tank2X >= 922 and tank2X <= 973 then
		tank2Y := 298
	    elsif position2 = 3 and tank2Y - 52 <= 550 and tank2Y - 52 >= 530 and tank2X - 38 >= 922 and tank2X - 38 <= 973 then
		tank2Y := 602
	    elsif position2 = 3 and tank2Y - 52 <= 550 and tank2Y - 52 >= 530 and tank2X + 38 >= 922 and tank2X + 38 <= 973 then
		tank2Y := 602
	    elsif position2 = 3 and tank2Y - 52 <= 550 and tank2Y - 52 >= 530 and tank2X >= 922 and tank2X <= 973 then
		tank2Y := 602
	    end if
	    %Collision - TopRight L Wall
	    if randomMap = 1 or randomMap = 2 then
		if position2 = 4 and tank2X + 52 <= 1019 and tank2X + 52 >= 999 and tank2Y - 38 <= 850 and tank2Y - 38 >= 650 then
		    tank2X := 947
		elsif position2 = 4 and tank2X + 52 <= 1019 and tank2X + 52 >= 999 and tank2Y + 38 <= 850 and tank2Y + 38 >= 650 then
		    tank2X := 947
		elsif position2 = 1 and tank2Y + 52 >= 650 and tank2Y + 52 <= 670 and tank2X + 38 >= 999 and tank2X + 38 <= 1125 then
		    tank2Y := 598
		elsif position2 = 1 and tank2Y + 52 >= 650 and tank2Y + 52 <= 670 and tank2X - 38 >= 999 and tank2X - 38 <= 1125 then
		    tank2Y := 598
		elsif position2 = 2 and tank2X - 52 <= 1050 and tank2X - 52 >= 1030 and tank2Y + 38 <= 850 and tank2Y + 38 >= 700 then
		    tank2X := 1102
		elsif position2 = 2 and tank2X - 52 <= 1050 and tank2X - 52 >= 1030 and tank2Y - 38 <= 850 and tank2Y - 38 >= 700 then
		    tank2X := 1102
		elsif position2 = 2 and tank2X - 52 <= 1126 and tank2X - 52 >= 1076 and tank2Y - 38 <= 699 and tank2Y - 38 >= 648 then
		    tank2X := 1178
		elsif position2 = 2 and tank2X - 52 <= 1126 and tank2X - 52 >= 1076 and tank2Y + 38 <= 699 and tank2Y + 38 >= 648 then
		    tank2X := 1178
		elsif position2 = 2 and tank2X - 52 <= 1126 and tank2X - 52 >= 1076 and tank2Y <= 699 and tank2Y >= 648 then
		    tank2X := 1178
		elsif position2 = 3 and tank2Y - 52 <= 700 and tank2Y - 52 >= 680 and tank2X + 38 >= 1050 and tank2X + 38 <= 1125 then
		    tank2Y := 752
		elsif position2 = 3 and tank2Y - 52 <= 700 and tank2Y - 52 >= 680 and tank2X - 38 >= 1050 and tank2X - 38 <= 1125 then
		    tank2Y := 752
		end if
	    end if
	    %Collision - BottomRight L Wall
	    if randomMap = 1 or randomMap = 2 then
		if position2 = 4 and tank2X + 52 <= 1019 and tank2X + 52 >= 999 and tank2Y - 38 <= 250 and tank2Y - 38 >= 50 then
		    tank2X := 947
		elsif position2 = 4 and tank2X + 52 <= 1019 and tank2X + 52 >= 999 and tank2Y + 38 <= 250 and tank2Y + 38 >= 50 then
		    tank2X := 947
		elsif position2 = 3 and tank2Y - 52 <= 250 and tank2Y - 52 >= 230 and tank2X + 38 >= 999 and tank2X + 38 <= 1125 then
		    tank2Y := 302
		elsif position2 = 3 and tank2Y - 52 <= 250 and tank2Y - 52 >= 230 and tank2X - 38 >= 999 and tank2X - 38 <= 1125 then
		    tank2Y := 302
		elsif position2 = 1 and tank2Y + 52 >= 200 and tank2Y + 52 <= 220 and tank2X - 38 >= 1050 and tank2X - 38 <= 1125 then
		    tank2Y := 148
		elsif position2 = 1 and tank2Y + 52 >= 200 and tank2Y + 52 <= 220 and tank2X + 38 >= 1050 and tank2X + 38 <= 1125 then
		    tank2Y := 148
		elsif position2 = 2 and tank2X - 52 <= 1126 and tank2X - 52 >= 1076 and tank2Y - 38 <= 250 and tank2Y - 38 >= 200 then
		    tank2X := 1178
		elsif position2 = 2 and tank2X - 52 <= 1126 and tank2X - 52 >= 1076 and tank2Y + 38 <= 250 and tank2Y + 38 >= 200 then
		    tank2X := 1178
		elsif position2 = 2 and tank2X - 52 <= 1126 and tank2X - 52 >= 1076 and tank2Y <= 250 and tank2Y >= 200 then
		    tank2X := 1178
		elsif position2 = 2 and tank2X - 52 <= 1050 and tank2X - 52 >= 1030 and tank2Y <= 200 and tank2Y >= 50 then
		    tank2X := 1102
		end if
	    end if
	    %Collision - Right BigWall
	    if randomMap = 1 then
		if position2 = 2 and tank2X - 52 <= 1326 and tank2X - 52 >= 1306 and tank2Y - 38 <= 700 and tank2Y - 38 >= 200 then
		    tank2X := 1378
		elsif position2 = 2 and tank2X - 52 <= 1326 and tank2X - 52 >= 1306 and tank2Y + 38 <= 700 and tank2Y + 38 >= 200 then
		    tank2X := 1378
		elsif position2 = 3 and tank2Y - 52 <= 700 and tank2Y - 52 >= 650 and tank2X - 38 >= 1275 and tank2X - 38 <= 1325 then
		    tank2Y := 752
		elsif position2 = 3 and tank2Y - 52 <= 700 and tank2Y - 52 >= 650 and tank2X + 38 >= 1275 and tank2X + 38 <= 1325 then
		    tank2Y := 752
		elsif position2 = 3 and tank2Y - 52 <= 700 and tank2Y - 52 >= 650 and tank2X >= 1275 and tank2X <= 1325 then
		    tank2Y := 752
		elsif position2 = 1 and tank2Y + 52 >= 200 and tank2Y + 52 <= 250 and tank2X + 38 >= 1275 and tank2X + 38 <= 1325 then
		    tank2Y := 148
		elsif position2 = 1 and tank2Y + 52 >= 200 and tank2Y + 52 <= 250 and tank2X - 38 >= 1275 and tank2X - 38 <= 1325 then
		    tank2Y := 148
		elsif position2 = 1 and tank2Y + 52 >= 200 and tank2Y + 52 <= 250 and tank2X >= 1275 and tank2X <= 1325 then
		    tank2Y := 148
		elsif position2 = 4 and tank2X + 52 >= 1275 and tank2X + 52 <= 1325 and tank2Y + 38 <= 425 and tank2Y + 38 >= 200 then
		    tank2X := 1223
		elsif position2 = 4 and tank2X + 52 >= 1275 and tank2X + 52 <= 1325 and tank2Y - 38 <= 425 and tank2Y - 38 >= 200 then
		    tank2X := 1223
		elsif position2 = 4 and tank2X + 52 >= 1275 and tank2X + 52 <= 1325 and tank2Y - 38 <= 700 and tank2Y - 38 >= 475 then
		    tank2X := 1223
		elsif position2 = 4 and tank2X + 52 >= 1275 and tank2X + 52 <= 1325 and tank2Y + 38 <= 700 and tank2Y + 38 >= 475 then
		    tank2X := 1223
		elsif position2 = 4 and tank2X + 52 >= 1175 and tank2X + 52 <= 1225 and tank2Y + 38 <= 475 and tank2Y + 38 >= 425 then
		    tank2X := 1123
		elsif position2 = 4 and tank2X + 52 >= 1175 and tank2X + 52 <= 1225 and tank2Y - 38 <= 475 and tank2Y - 38 >= 425 then
		    tank2X := 1123
		elsif position2 = 4 and tank2X + 52 >= 1175 and tank2X + 52 <= 1225 and tank2Y <= 475 and tank2Y >= 425 then
		    tank2X := 1123
		elsif position2 = 1 and tank2Y + 52 >= 425 and tank2Y + 52 <= 445 and tank2X + 38 >= 1175 and tank2X + 38 <= 1275 then
		    tank2Y := 373
		elsif position2 = 1 and tank2Y + 52 >= 425 and tank2Y + 52 <= 445 and tank2X - 38 >= 1175 and tank2X - 38 <= 1275 then
		    tank2Y := 373
		elsif position2 = 3 and tank2Y - 52 <= 475 and tank2Y - 52 >= 455 and tank2X + 38 >= 1175 and tank2X + 38 <= 1275 then
		    tank2Y := 527
		elsif position2 = 3 and tank2Y - 52 <= 475 and tank2Y - 52 >= 455 and tank2X - 38 >= 1175 and tank2X - 38 <= 1275 then
		    tank2Y := 527
		end if
	    end if
	    %Bullets - Tank1 - If the fire button is pressed, then set the bullet's coordinates to the corresponding direction the tank is facing
	    if drawBullet1 = 1 then
		if direction1 = 0 then
		    bullet1Y := tank1Y + 25
		    bullet1X := tank1X
		    bullet1Midair := 0
		    drawBullet1 := 0
		elsif direction1 = 1 then
		    bullet1Y := tank1Y + 5
		    bullet1X := tank1X + 5
		    bullet1Midair := 1
		    drawBullet1 := 0
		elsif direction1 = 2 then
		    bullet1Y := tank1Y
		    bullet1X := tank1X + 25
		    bullet1Midair := 2
		    drawBullet1 := 0
		elsif direction1 = 3 then
		    bullet1Y := tank1Y - 5
		    bullet1X := tank1X + 5
		    bullet1Midair := 3
		    drawBullet1 := 0
		elsif direction1 = 4 then
		    bullet1Y := tank1Y - 25
		    bullet1X := tank1X
		    bullet1Midair := 4
		    drawBullet1 := 0
		elsif direction1 = 5 then
		    bullet1Y := tank1Y - 5
		    bullet1X := tank1X - 5
		    bullet1Midair := 5
		    drawBullet1 := 0
		elsif direction1 = 6 then
		    bullet1Y := tank1Y
		    bullet1X := tank1X - 25
		    bullet1Midair := 6
		    drawBullet1 := 0
		elsif direction1 = 7 then
		    bullet1Y := tank1Y + 5
		    bullet1X := tank1X - 5
		    bullet1Midair := 7
		    drawBullet1 := 0
		end if
	    end if
	    %Bullets - Tank2 - If the fire button is pressed, then set the bullet's coordinates to the corresponding direction the tank is facing
	    if drawBullet2 = 1 then
		if direction2 = 0 then
		    bullet2Y := tank2Y + 25
		    bullet2X := tank2X
		    bullet2Midair := 0
		    drawBullet2 := 0
		elsif direction2 = 1 then
		    bullet2Y := tank2Y + 5
		    bullet2X := tank2X + 5
		    bullet2Midair := 1
		    drawBullet2 := 0
		elsif direction2 = 2 then
		    bullet2Y := tank2Y
		    bullet2X := tank2X + 25
		    bullet2Midair := 2
		    drawBullet2 := 0
		elsif direction2 = 3 then
		    bullet2Y := tank2Y - 5
		    bullet2X := tank2X + 5
		    bullet2Midair := 3
		    drawBullet2 := 0
		elsif direction2 = 4 then
		    bullet2Y := tank2Y - 25
		    bullet2X := tank2X
		    bullet2Midair := 4
		    drawBullet2 := 0
		elsif direction2 = 5 then
		    bullet2Y := tank2Y - 5
		    bullet2X := tank2X - 5
		    bullet2Midair := 5
		    drawBullet2 := 0
		elsif direction2 = 6 then
		    bullet2Y := tank2Y
		    bullet2X := tank2X - 25
		    bullet2Midair := 6
		    drawBullet2 := 0
		elsif direction2 = 7 then
		    bullet2Y := tank2Y + 5
		    bullet2X := tank2X - 5
		    bullet2Midair := 7
		    drawBullet2 := 0
		end if
	    end if
	    %Bullet Movement - Bullet 1 - If the bullet is in the middle of firing, add/remove from its x/y depending on which way it is firing
	    if bullet1Midair = 0 or bullet1Midair = 1 or bullet1Midair = 7 then
		bullet1Y := bullet1Y + bulletSpeed
	    end if
	    if bullet1Midair = 1 or bullet1Midair = 2 or bullet1Midair = 3 then
		bullet1X := bullet1X + bulletSpeed
	    end if
	    if bullet1Midair = 3 or bullet1Midair = 4 or bullet1Midair = 5 then
		bullet1Y := bullet1Y - bulletSpeed
	    end if
	    if bullet1Midair = 5 or bullet1Midair = 6 or bullet1Midair = 7 then
		bullet1X := bullet1X - bulletSpeed
	    end if
	    %Bullet Movement - Bullet 2 - If the bullet is in the middle of firing, add/remove from its x/y depending on which way it is firing
	    if bullet2Midair = 0 or bullet2Midair = 1 or bullet2Midair = 7 then
		bullet2Y := bullet2Y + bulletSpeed
	    end if
	    if bullet2Midair = 1 or bullet2Midair = 2 or bullet2Midair = 3 then
		bullet2X := bullet2X + bulletSpeed
	    end if
	    if bullet2Midair = 3 or bullet2Midair = 4 or bullet2Midair = 5 then
		bullet2Y := bullet2Y - bulletSpeed
	    end if
	    if bullet2Midair = 5 or bullet2Midair = 6 or bullet2Midair = 7 then
		bullet2X := bullet2X - bulletSpeed
	    end if
	    %Ensures that the health of each tank can't go below 0, to make sure the health display doesn't look weird
	    if tank1Health < 0 then
		tank1Health := 0
	    end if
	    if tank2Health < 0 then
		tank2Health := 0
	    end if
	    %Collision - Bullet1 to Map - If the bullet hits any of the walls, stop drawing it
	    %Borders
	    if bullet1X >= 1475 or bullet1X <= 25 or bullet1Y >= 875 or bullet1Y <= 25 or bullet1Y <= 25 then
		bullet1Midair := 8
	    end if
	    if randomMap = 1 then
		%Left BigWall
		if bullet1X >= 171 and bullet1X <= 222 and bullet1Y >= 200 and bullet1Y <= 700 or bullet1X >= 222 and bullet1X <= 324 and bullet1Y >= 425 and bullet1Y <= 475 then
		    bullet1Midair := 8
		end if
		%Right Bigwall
		if bullet1X >= 1175 and bullet1X <= 1275 and bullet1Y >= 425 and bullet1Y <= 475 or bullet1X >= 1275 and bullet1X <= 1375 and bullet1Y >= 200 and bullet1Y <= 700 then
		    bullet1Midair := 8
		end if
	    end if
	    if randomMap = 1 or randomMap = 2 then
		%Topleft L wall
		if bullet1X >= 375 and bullet1X <= 500 and bullet1Y >= 650 and bullet1Y <= 700 or bullet1X >= 450 and bullet1X <= 500 and bullet1Y >= 700 and bullet1Y <= 850 then
		    bullet1Midair := 8
		end if
		%BottomLeft L wall
		if bullet1X >= 375 and bullet1X <= 500 and bullet1Y >= 200 and bullet1Y <= 250 or bullet1X >= 450 and bullet1X <= 500 and bullet1Y >= 50 and bullet1Y <= 200 then
		    bullet1Midair := 8
		end if
		%Topright L wall
		if bullet1X >= 1000 and bullet1X <= 1050 and bullet1Y >= 700 and bullet1Y <= 850 or bullet1X >= 1000 and bullet1X <= 1125 and bullet1Y >= 650 and bullet1Y <= 700 then
		    bullet1Midair := 8
		end if
		%Bottomright L wall
		if bullet1X >= 1000 and bullet1X <= 1125 and bullet1Y >= 200 and bullet1Y <= 250 or bullet1X >= 1000 and bullet1X <= 1050 and bullet1Y >= 50 and bullet1Y <= 200 then
		    bullet1Midair := 8
		end if
	    end if
	    %Left Midwall
	    if bullet1X >= 525 and bullet1X <= 575 and bullet1Y >= 350 and bullet1Y <= 550 then
		bullet1Midair := 8
		%Right Midwall
	    elsif bullet1X >= 925 and bullet1X <= 975 and bullet1Y >= 350 and bullet1Y <= 550 then
		bullet1Midair := 8
	    end if
	    %Collision - Bullet2 to Map  - If the bullet hits any of the walls, stop drawing it
	    %Borders
	    if bullet2X >= 1475 or bullet2X <= 25 or bullet2Y >= 875 or bullet2Y <= 25 or bullet2Y <= 25 then
		bullet2Midair := 8
	    end if
	    if randomMap = 1 then
		%Left BigWall
		if bullet2X >= 171 and bullet2X <= 222 and bullet2Y >= 200 and bullet2Y <= 700 or bullet2X >= 222 and bullet2X <= 324 and bullet2Y >= 425 and bullet2Y <= 475 then
		    bullet2Midair := 8
		end if
		%Right Bigwall
		if bullet2X >= 1175 and bullet2X <= 1275 and bullet2Y >= 425 and bullet2Y <= 475 or bullet2X >= 1275 and bullet2X <= 1375 and bullet2Y >= 200 and bullet2Y <= 700 then
		    bullet2Midair := 8
		end if
	    end if
	    if randomMap = 1 or randomMap = 2 then
		%Topleft L wall
		if bullet2X >= 375 and bullet2X <= 500 and bullet2Y >= 650 and bullet2Y <= 700 or bullet2X >= 450 and bullet2X <= 500 and bullet2Y >= 700 and bullet2Y <= 850 then
		    bullet2Midair := 8
		end if
		%BottomLeft L wall
		if bullet2X >= 375 and bullet2X <= 500 and bullet2Y >= 200 and bullet2Y <= 250 or bullet2X >= 450 and bullet2X <= 500 and bullet2Y >= 50 and bullet2Y <= 200 then
		    bullet2Midair := 8
		end if
		%Topright L wall
		if bullet2X >= 1000 and bullet2X <= 1050 and bullet2Y >= 700 and bullet2Y <= 850 or bullet2X >= 1000 and bullet2X <= 1125 and bullet2Y >= 650 and bullet2Y <= 700 then
		    bullet2Midair := 8
		end if
		%Bottomright L wall
		if bullet2X >= 1000 and bullet2X <= 1125 and bullet2Y >= 200 and bullet2Y <= 250 or bullet2X >= 1000 and bullet2X <= 1050 and bullet2Y >= 50 and bullet2Y <= 200 then
		    bullet2Midair := 8
		end if
	    end if
	    %Left Midwall
	    if bullet2X >= 525 and bullet2X <= 575 and bullet2Y >= 350 and bullet2Y <= 550 then
		bullet2Midair := 8
		%Right Midwall
	    elsif bullet2X >= 925 and bullet2X <= 975 and bullet2Y >= 350 and bullet2Y <= 550 then
		bullet2Midair := 8
	    end if
	    %Collision - Tank1 to Tank2 - If tank1 hits tank2, change tank1's coordinates back to what it was before
	    if tank1side2 > tank2side1 and tank1side2 < tank2side1 + 30 and tank1Y > tank2bottom and tank1Y < tank2top then
		tank1X := tank2side1 - 38
	    elsif tank1side1 < tank2side2 and tank1side2 > tank2side2 - 30 and tank1Y > tank2bottom and tank1Y < tank2top then
		tank1X := tank2side2 + 38
	    elsif tank1top > tank2bottom and tank1top < tank2bottom + 30 and tank1X > tank2side1 and tank1X < tank2side2 then
		tank1Y := tank2bottom - 52
	    elsif tank1bottom > tank2top - 30 and tank1bottom < tank2top and tank1X > tank2side1 and tank1X < tank2side2 then
		tank1Y := tank2top + 52
	    end if
	    %Collision - Tank2 to Tank1 - If tank2 hits tank1, change tank2's coordinates back to what it was before
	    if tank2side2 > tank1side1 and tank2side2 < tank1side1 + 30 and tank2Y > tank1bottom and tank2Y < tank1top then
		tank2X := tank1side1 - 38
	    elsif tank2side1 < tank1side2 and tank2side2 > tank1side2 - 30 and tank2Y > tank1bottom and tank2Y < tank1top then
		tank2X := tank1side2 + 38
	    elsif tank2top > tank1bottom and tank2top < tank1bottom + 30 and tank2X > tank1side1 and tank2X < tank1side2 then
		tank2Y := tank1bottom - 52
	    elsif tank2bottom > tank1top - 30 and tank2bottom < tank1top and tank2X > tank1side1 and tank2X < tank1side2 then
		tank2Y := tank1top + 52
	    end if
	    %Drawing - Bullet1 - Draws a specific bullet image depending on which way the tank is facing
	    if bullet1Midair = 0 then
		Pic.Draw (bullet1up, bullet1X - 12, bullet1Y - 12, picMerge)
	    elsif bullet1Midair = 1 then
		Pic.Draw (bullet1upright, bullet1X - 12, bullet1Y - 12, picMerge)
	    elsif bullet1Midair = 2 then
		Pic.Draw (bullet1right, bullet1X - 12, bullet1Y - 12, picMerge)
	    elsif bullet1Midair = 3 then
		Pic.Draw (bullet1downright, bullet1X - 12, bullet1Y - 12, picMerge)
	    elsif bullet1Midair = 4 then
		Pic.Draw (bullet1down, bullet1X - 12, bullet1Y - 12, picMerge)
	    elsif bullet1Midair = 5 then
		Pic.Draw (bullet1downleft, bullet1X - 12, bullet1Y - 12, picMerge)
	    elsif bullet1Midair = 6 then
		Pic.Draw (bullet1left, bullet1X - 12, bullet1Y - 12, picMerge)
	    elsif bullet1Midair = 7 then
		Pic.Draw (bullet1upleft, bullet1X - 12, bullet1Y - 12, picMerge)
	    end if
	    %Drawing - Bullet2 - Draws a specific bullet image depending on which way the tank is facing
	    if bullet2Midair = 0 then
		Pic.Draw (bullet2up, bullet2X - 12, bullet2Y - 12, picMerge)
	    elsif bullet2Midair = 1 then
		Pic.Draw (bullet2upright, bullet2X - 12, bullet2Y - 12, picMerge)
	    elsif bullet2Midair = 2 then
		Pic.Draw (bullet2right, bullet2X - 12, bullet2Y - 12, picMerge)
	    elsif bullet2Midair = 3 then
		Pic.Draw (bullet2downright, bullet2X - 12, bullet2Y - 12, picMerge)
	    elsif bullet2Midair = 4 then
		Pic.Draw (bullet2down, bullet2X - 12, bullet2Y - 12, picMerge)
	    elsif bullet2Midair = 5 then
		Pic.Draw (bullet2downleft, bullet2X - 12, bullet2Y - 12, picMerge)
	    elsif bullet2Midair = 6 then
		Pic.Draw (bullet2left, bullet2X - 12, bullet2Y - 12, picMerge)
	    elsif bullet2Midair = 7 then
		Pic.Draw (bullet2upleft, bullet2X - 12, bullet2Y - 12, picMerge)
	    end if
	    %Drawing - Tank 1 - Draws a specific tank file based on a combination of which way the tank is facing and which way the turret is facing
	    if position1 = 1 then
		if direction1 = 0 then
		    Pic.Draw (tank1up0, tank1X - 87, tank1Y - 88, picMerge)
		elsif direction1 = 1 then
		    Pic.Draw (tank1up45, tank1X - 87, tank1Y - 88, picMerge)
		elsif direction1 = 2 then
		    Pic.Draw (tank1up90, tank1X - 87, tank1Y - 88, picMerge)
		elsif direction1 = 3 then
		    Pic.Draw (tank1up135, tank1X - 87, tank1Y - 88, picMerge)
		elsif direction1 = 4 then
		    Pic.Draw (tank1up180, tank1X - 87, tank1Y - 88, picMerge)
		elsif direction1 = 5 then
		    Pic.Draw (tank1up225, tank1X - 87, tank1Y - 88, picMerge)
		elsif direction1 = 6 then
		    Pic.Draw (tank1up270, tank1X - 87, tank1Y - 88, picMerge)
		elsif direction1 = 7 then
		    Pic.Draw (tank1up315, tank1X - 87, tank1Y - 88, picMerge)
		end if
	    elsif position1 = 2 then
		if direction1 = 0 then
		    Pic.Draw (tank1left0, tank1X - 87, tank1Y - 88, picMerge)
		elsif direction1 = 1 then
		    Pic.Draw (tank1left45, tank1X - 87, tank1Y - 88, picMerge)
		elsif direction1 = 2 then
		    Pic.Draw (tank1left90, tank1X - 87, tank1Y - 88, picMerge)
		elsif direction1 = 3 then
		    Pic.Draw (tank1left135, tank1X - 87, tank1Y - 88, picMerge)
		elsif direction1 = 4 then
		    Pic.Draw (tank1left180, tank1X - 87, tank1Y - 88, picMerge)
		elsif direction1 = 5 then
		    Pic.Draw (tank1left225, tank1X - 87, tank1Y - 88, picMerge)
		elsif direction1 = 6 then
		    Pic.Draw (tank1left270, tank1X - 87, tank1Y - 88, picMerge)
		elsif direction1 = 7 then
		    Pic.Draw (tank1left315, tank1X - 87, tank1Y - 88, picMerge)
		end if
	    elsif position1 = 3 then
		if direction1 = 0 then
		    Pic.Draw (tank1down0, tank1X - 87, tank1Y - 88, picMerge)
		elsif direction1 = 1 then
		    Pic.Draw (tank1down45, tank1X - 87, tank1Y - 88, picMerge)
		elsif direction1 = 2 then
		    Pic.Draw (tank1down90, tank1X - 87, tank1Y - 88, picMerge)
		elsif direction1 = 3 then
		    Pic.Draw (tank1down135, tank1X - 87, tank1Y - 88, picMerge)
		elsif direction1 = 4 then
		    Pic.Draw (tank1down180, tank1X - 87, tank1Y - 88, picMerge)
		elsif direction1 = 5 then
		    Pic.Draw (tank1down225, tank1X - 87, tank1Y - 88, picMerge)
		elsif direction1 = 6 then
		    Pic.Draw (tank1down270, tank1X - 87, tank1Y - 88, picMerge)
		elsif direction1 = 7 then
		    Pic.Draw (tank1down315, tank1X - 87, tank1Y - 88, picMerge)
		end if
	    elsif position1 = 4 then
		if direction1 = 0 then
		    Pic.Draw (tank1right0, tank1X - 87, tank1Y - 88, picMerge)
		elsif direction1 = 1 then
		    Pic.Draw (tank1right45, tank1X - 87, tank1Y - 88, picMerge)
		elsif direction1 = 2 then
		    Pic.Draw (tank1right90, tank1X - 87, tank1Y - 88, picMerge)
		elsif direction1 = 3 then
		    Pic.Draw (tank1right135, tank1X - 87, tank1Y - 88, picMerge)
		elsif direction1 = 4 then
		    Pic.Draw (tank1right180, tank1X - 87, tank1Y - 88, picMerge)
		elsif direction1 = 5 then
		    Pic.Draw (tank1right225, tank1X - 87, tank1Y - 88, picMerge)
		elsif direction1 = 6 then
		    Pic.Draw (tank1right270, tank1X - 87, tank1Y - 88, picMerge)
		elsif direction1 = 7 then
		    Pic.Draw (tank1right315, tank1X - 87, tank1Y - 88, picMerge)
		end if
	    end if
	    %Tank 2 Drawing - Draws a specific tank file based on a combination of which way the tank is facing and which way the turret is facing
	    if position2 = 1 then
		if direction2 = 0 then
		    Pic.Draw (tank2up0, tank2X - 87, tank2Y - 88, picMerge)
		elsif direction2 = 1 then
		    Pic.Draw (tank2up45, tank2X - 87, tank2Y - 88, picMerge)
		elsif direction2 = 2 then
		    Pic.Draw (tank2up90, tank2X - 87, tank2Y - 88, picMerge)
		elsif direction2 = 3 then
		    Pic.Draw (tank2up135, tank2X - 87, tank2Y - 88, picMerge)
		elsif direction2 = 4 then
		    Pic.Draw (tank2up180, tank2X - 87, tank2Y - 88, picMerge)
		elsif direction2 = 5 then
		    Pic.Draw (tank2up225, tank2X - 87, tank2Y - 88, picMerge)
		elsif direction2 = 6 then
		    Pic.Draw (tank2up270, tank2X - 87, tank2Y - 88, picMerge)
		elsif direction2 = 7 then
		    Pic.Draw (tank2up315, tank2X - 87, tank2Y - 88, picMerge)
		end if
	    elsif position2 = 2 then
		if direction2 = 0 then
		    Pic.Draw (tank2left0, tank2X - 87, tank2Y - 88, picMerge)
		elsif direction2 = 1 then
		    Pic.Draw (tank2left45, tank2X - 87, tank2Y - 88, picMerge)
		elsif direction2 = 2 then
		    Pic.Draw (tank2left90, tank2X - 87, tank2Y - 88, picMerge)
		elsif direction2 = 3 then
		    Pic.Draw (tank2left135, tank2X - 87, tank2Y - 88, picMerge)
		elsif direction2 = 4 then
		    Pic.Draw (tank2left180, tank2X - 87, tank2Y - 88, picMerge)
		elsif direction2 = 5 then
		    Pic.Draw (tank2left225, tank2X - 87, tank2Y - 88, picMerge)
		elsif direction2 = 6 then
		    Pic.Draw (tank2left270, tank2X - 87, tank2Y - 88, picMerge)
		elsif direction2 = 7 then
		    Pic.Draw (tank2left315, tank2X - 87, tank2Y - 88, picMerge)
		end if
	    elsif position2 = 3 then
		if direction2 = 0 then
		    Pic.Draw (tank2down0, tank2X - 87, tank2Y - 88, picMerge)
		elsif direction2 = 1 then
		    Pic.Draw (tank2down45, tank2X - 87, tank2Y - 88, picMerge)
		elsif direction2 = 2 then
		    Pic.Draw (tank2down90, tank2X - 87, tank2Y - 88, picMerge)
		elsif direction2 = 3 then
		    Pic.Draw (tank2down135, tank2X - 87, tank2Y - 88, picMerge)
		elsif direction2 = 4 then
		    Pic.Draw (tank2down180, tank2X - 87, tank2Y - 88, picMerge)
		elsif direction2 = 5 then
		    Pic.Draw (tank2down225, tank2X - 87, tank2Y - 88, picMerge)
		elsif direction2 = 6 then
		    Pic.Draw (tank2down270, tank2X - 87, tank2Y - 88, picMerge)
		elsif direction2 = 7 then
		    Pic.Draw (tank2down315, tank2X - 87, tank2Y - 88, picMerge)
		end if
	    elsif position2 = 4 then
		if direction2 = 0 then
		    Pic.Draw (tank2right0, tank2X - 87, tank2Y - 88, picMerge)
		elsif direction2 = 1 then
		    Pic.Draw (tank2right45, tank2X - 87, tank2Y - 88, picMerge)
		elsif direction2 = 2 then
		    Pic.Draw (tank2right90, tank2X - 87, tank2Y - 88, picMerge)
		elsif direction2 = 3 then
		    Pic.Draw (tank2right135, tank2X - 87, tank2Y - 88, picMerge)
		elsif direction2 = 4 then
		    Pic.Draw (tank2right180, tank2X - 87, tank2Y - 88, picMerge)
		elsif direction2 = 5 then
		    Pic.Draw (tank2right225, tank2X - 87, tank2Y - 88, picMerge)
		elsif direction2 = 6 then
		    Pic.Draw (tank2right270, tank2X - 87, tank2Y - 88, picMerge)
		elsif direction2 = 7 then
		    Pic.Draw (tank2right315, tank2X - 87, tank2Y - 88, picMerge)
		end if
	    end if
	    %Collision - Bullet1 to Tank2 - If bullet1 hits tank2, stop firing the bullet, remove health from the tank, and move the bullet to offscreen
	    if bullet1X >= tank2side1 and bullet1X <= tank2side2 and bullet1Y >= tank2bottom and bullet1Y <= tank2top and bullet1Midair not= 8 then
		bullet1Midair := 8
		tank2Health := tank2Health - bullet1Damage
		explosionTimer1 := 1
	    end if
	    %Collision - Bullet2 to Tank1 - If bullet2 hits tank1, stop firing the bullet, remove health from the tank, and move the bullet to offscreen
	    if bullet2X >= tank1side1 and bullet2X <= tank1side2 and bullet2Y >= tank1bottom and bullet2Y <= tank1top and bullet2Midair not= 8 then
		bullet2Midair := 8
		tank1Health := tank1Health - bullet2Damage
		explosionTimer2 := 1
	    end if
	    %Draw Explosion if the bullet hits a tank
	    if explosionTimer1 > 0 then
		Pic.Draw (explosion, (tank2side1 + tank2side2) div 2 - 38, (tank2bottom + tank2top) div 2 - 38, picMerge)
	    end if
	    if explosionTimer2 > 0 then
		Pic.Draw (explosion, (tank1side1 + tank1side2) div 2 - 38, (tank1bottom + tank1top) div 2 - 38, picMerge)
	    end if
	    %Drawing - Mine1 - If the timer fits in a specific catergory of the countdown timer (divided into 10 stages), draw a specific bomb image
	    if mineTimer1 > 0 and mineTimer1 < mineMaxTime then
		if mineTimer1 <= mineMaxTime div 10 and mineTimer1 > 0 then
		    Pic.Draw (bomb1stage1, mine1X, mine1Y, picMerge)
		elsif mineTimer1 <= mineMaxTime div 10 * 2 and mineTimer1 > mineMaxTime div 10 then
		    Pic.Draw (bomb1stage2, mine1X, mine1Y, picMerge)
		elsif mineTimer1 <= mineMaxTime div 10 * 3 and mineTimer1 > mineMaxTime div 10 * 2 then
		    Pic.Draw (bomb1stage3, mine1X, mine1Y, picMerge)
		elsif mineTimer1 <= mineMaxTime div 10 * 4 and mineTimer1 > mineMaxTime div 10 * 3 then
		    Pic.Draw (bomb1stage4, mine1X, mine1Y, picMerge)
		elsif mineTimer1 <= mineMaxTime div 10 * 5 and mineTimer1 > mineMaxTime div 10 * 4 then
		    Pic.Draw (bomb1stage5, mine1X, mine1Y, picMerge)
		elsif mineTimer1 <= mineMaxTime div 10 * 6 and mineTimer1 > mineMaxTime div 10 * 5 then
		    Pic.Draw (bomb1stage6, mine1X, mine1Y, picMerge)
		elsif mineTimer1 <= mineMaxTime div 10 * 7 and mineTimer1 > mineMaxTime div 10 * 6 then
		    Pic.Draw (bomb1stage7, mine1X, mine1Y, picMerge)
		elsif mineTimer1 <= mineMaxTime div 10 * 8 and mineTimer1 > mineMaxTime div 10 * 7 then
		    Pic.Draw (bomb1stage8, mine1X, mine1Y, picMerge)
		elsif mineTimer1 <= mineMaxTime div 10 * 9 and mineTimer1 > mineMaxTime div 10 * 8 then
		    Pic.Draw (bomb1stage9, mine1X, mine1Y, picMerge)
		elsif mineTimer1 <= mineMaxTime and mineTimer1 > mineMaxTime div 10 * 9 then
		    Pic.Draw (bomb1stage10, mine1X, mine1Y, picMerge)
		end if
	    end if
	    %Drawing - Mine2 - If the timer fits in a specific catergory of the countdown timer (divided into 10 stages), draw a specific bomb image
	    if mineTimer2 > 0 and mineTimer2 < mineMaxTime then
		if mineTimer2 <= mineMaxTime div 10 and mineTimer2 > 0 then
		    Pic.Draw (bomb2stage1, mine2X, mine2Y, picMerge)
		elsif mineTimer2 <= mineMaxTime div 10 * 2 and mineTimer2 > mineMaxTime div 10 then
		    Pic.Draw (bomb2stage2, mine2X, mine2Y, picMerge)
		elsif mineTimer2 <= mineMaxTime div 10 * 3 and mineTimer2 > mineMaxTime div 10 * 2 then
		    Pic.Draw (bomb2stage3, mine2X, mine2Y, picMerge)
		elsif mineTimer2 <= mineMaxTime div 10 * 4 and mineTimer2 > mineMaxTime div 10 * 3 then
		    Pic.Draw (bomb2stage4, mine2X, mine2Y, picMerge)
		elsif mineTimer2 <= mineMaxTime div 10 * 5 and mineTimer2 > mineMaxTime div 10 * 4 then
		    Pic.Draw (bomb2stage5, mine2X, mine2Y, picMerge)
		elsif mineTimer2 <= mineMaxTime div 10 * 6 and mineTimer2 > mineMaxTime div 10 * 5 then
		    Pic.Draw (bomb2stage6, mine2X, mine2Y, picMerge)
		elsif mineTimer2 <= mineMaxTime div 10 * 7 and mineTimer2 > mineMaxTime div 10 * 6 then
		    Pic.Draw (bomb2stage7, mine2X, mine2Y, picMerge)
		elsif mineTimer2 <= mineMaxTime div 10 * 8 and mineTimer2 > mineMaxTime div 10 * 7 then
		    Pic.Draw (bomb2stage8, mine2X, mine2Y, picMerge)
		elsif mineTimer2 <= mineMaxTime div 10 * 9 and mineTimer2 > mineMaxTime div 10 * 8 then
		    Pic.Draw (bomb2stage9, mine2X, mine2Y, picMerge)
		elsif mineTimer2 <= mineMaxTime and mineTimer2 > mineMaxTime div 10 * 9 then
		    Pic.Draw (bomb2stage10, mine2X, mine2Y, picMerge)
		end if
	    end if
	    %Collision - Mine1 to Tank2 - If the tank is in radius of the mine when it blows up, get rid of the mine and deal damage to the tank
	    if mineTimer1 >= mineMaxTime then
		if tank2side2 >= mine1X - mineRadius and tank2side2 <= mine1X + 76 + mineRadius and tank2top >= mine1Y - mineRadius and tank2top <= mine1Y + 76 + mineRadius
			then
		    mineTimer1 := 0
		    drawMine1 := 0
		    tank2Health := tank2Health - mineDamage
		elsif tank2side2 >= mine1X - mineRadius and tank2side2 <= mine1X + 76 + mineRadius and tank2bottom >= mine1Y - mineRadius and tank2bottom <= mine1Y + 76 +
			mineRadius then
		    mineTimer1 := 0
		    drawMine1 := 0
		    tank2Health := tank2Health - mineDamage
		elsif tank2side1 >= mine1X - mineRadius and tank2side1 <= mine1X + 76 + mineRadius and tank2bottom >= mine1Y - mineRadius and tank2bottom <= mine1Y + 76 +
			mineRadius then
		    mineTimer1 := 0
		    drawMine1 := 0
		    tank2Health := tank2Health - mineDamage
		elsif tank2side1 >= mine1X - mineRadius and tank2side1 <= mine1X + 76 + mineRadius and tank2top >= mine1Y - mineRadius and tank2top <= mine1Y + 76 +
			mineRadius
			then
		    mineTimer1 := 0
		    drawMine1 := 0
		    tank2Health := tank2Health - mineDamage
		elsif tank2top >= mine1Y - mineRadius and tank2top <= mine1Y + 76 + mineRadius and tank2side1 >= mine1X - mineRadius and tank2side1 <= mine1X + 76 +
			mineRadius
			then
		    mineTimer1 := 0
		    drawMine1 := 0
		    tank2Health := tank2Health - mineDamage
		elsif tank2top >= mine1Y - mineRadius and tank2top <= mine1Y + 76 + mineRadius and tank2side2 >= mine1X - mineRadius and tank2side2 <= mine1X + 76 +
			mineRadius
			then
		    mineTimer1 := 0
		    drawMine1 := 0
		    tank2Health := tank2Health - mineDamage
		elsif tank2bottom >= mine1Y - mineRadius and tank2bottom <= mine1Y + 76 + mineRadius and tank2side1 >= mine1X - mineRadius and tank2side1 <= mine1X + 76 +
			mineRadius then
		    mineTimer1 := 0
		    drawMine1 := 0
		    tank2Health := tank2Health - mineDamage
		elsif tank2bottom >= mine1Y - mineRadius and tank2bottom <= mine1Y + 76 + mineRadius and tank2side2 >= mine1X - mineRadius and tank2side2 <= mine1X + 76 +
			mineRadius then
		    mineTimer1 := 0
		    drawMine1 := 0
		    tank2Health := tank2Health - mineDamage
		end if
	    end if
	    %Collision - Mine2 to Tank1 - If the tank is in radius of the mine when it blows up, get rid of the mine and deal damage to the tank
	    if mineTimer2 >= mineMaxTime then
		if tank1side2 >= mine2X - mineRadius and tank1side2 <= mine2X + 76 + mineRadius and tank1top >= mine2Y - mineRadius and tank1top <= mine2Y + 76 + mineRadius
			then
		    mineTimer2 := 0
		    drawMine2 := 0
		    tank1Health := tank1Health - mineDamage
		elsif tank1side2 >= mine2X - mineRadius and tank1side2 <= mine2X + 76 + mineRadius and tank1bottom >= mine2Y - mineRadius and tank1bottom <= mine2Y + 76 +
			mineRadius then
		    mineTimer2 := 0
		    drawMine2 := 0
		    tank1Health := tank1Health - mineDamage
		elsif tank1side1 >= mine2X - mineRadius and tank1side1 <= mine2X + 76 + mineRadius and tank1bottom >= mine2Y - mineRadius and tank1bottom <= mine2Y + 76 +
			mineRadius then
		    mineTimer2 := 0
		    drawMine2 := 0
		    tank1Health := tank1Health - mineDamage
		elsif tank1side1 >= mine2X - mineRadius and tank1side1 <= mine2X + 76 + mineRadius and tank1top >= mine2Y - mineRadius and tank1top <= mine2Y + 76 +
			mineRadius then
		    mineTimer2 := 0
		    drawMine2 := 0
		    tank1Health := tank1Health - mineDamage
		elsif tank1top >= mine2Y - mineRadius and tank1top <= mine2Y + 76 + mineRadius and tank1side1 >= mine2X - mineRadius and tank1side1 <= mine2X + 76 +
			mineRadius
			then
		    mineTimer2 := 0
		    drawMine2 := 0
		    tank1Health := tank1Health - mineDamage
		elsif tank1top >= mine2Y - mineRadius and tank1top <= mine2Y + 76 + mineRadius and tank1side2 >= mine2X - mineRadius and tank1side2 <= mine2X + 76 +
			mineRadius
			then
		    mineTimer2 := 0
		    drawMine2 := 0
		    tank1Health := tank1Health - mineDamage
		elsif tank1bottom >= mine2Y - mineRadius and tank1bottom <= mine2Y + 76 + mineRadius and tank1side1 >= mine2X - mineRadius and tank1side1 <= mine2X + 76 +
			mineRadius then
		    mineTimer2 := 0
		    drawMine2 := 0
		    tank1Health := tank1Health - mineDamage
		elsif tank1bottom >= mine2Y - mineRadius and tank1bottom <= mine2Y + 76 + mineRadius and tank1side2 >= mine2X - mineRadius and tank1side2 <= mine2X + 76 +
			mineRadius then
		    mineTimer2 := 0
		    drawMine2 := 0
		    tank1Health := tank1Health - mineDamage
		end if
	    end if
	    %If the timer hits the limit, get rid of the mine and draw an explosion
	    if mineTimer1 >= mineMaxTime + 100 then
		Pic.Draw (explosion, mine1X, mine1Y, picMerge)
		mineTimer1 := 0
		drawMine1 := 0
	    elsif mineTimer1 >= mineMaxTime then
		Pic.Draw (explosion, mine1X, mine1Y, picMerge)
	    end if
	    if mineTimer2 >= mineMaxTime + 100 then
		Pic.Draw (explosion, mine2X, mine2Y, picMerge)
		mineTimer2 := 0
		drawMine2 := 0
	    elsif mineTimer2 >= mineMaxTime then
		Pic.Draw (explosion, mine2X, mine2Y, picMerge)
	    end if
	    %Drawing - Power Ups - Depeding on the random number generated, the mine's X and Y will change to spawn in different places in the map
	    if enablePowerUp = "Yes" then
		if powerUpPos = 1 then
		    powerUpX := 172
		    powerUpY := 725
		elsif powerUpPos = 2 then
		    powerUpX := 172
		    powerUpY := 99
		elsif powerUpPos = 3 then
		    powerUpX := 674
		    powerUpY := 725
		elsif powerUpPos = 4 then
		    powerUpX := 674
		    powerUpY := 374
		elsif powerUpPos = 5 then
		    powerUpX := 674
		    powerUpY := 99
		elsif powerUpPos = 6 then
		    powerUpX := 1250
		    powerUpY := 725
		elsif powerUpPos = 7 then
		    powerUpX := 1250
		    powerUpY := 99
		end if
	    end if
	    %Draw a specific power up depending on which type was randomly generated
	    if drawPowerUp = 1 then
		if powerUpType = 1 then
		    Pic.Draw (powerUpHealth, powerUpX, powerUpY, picMerge)
		elsif powerUpType = 2 then
		    Pic.Draw (powerUpIncreaseHeal, powerUpX, powerUpY, picMerge)
		elsif powerUpType = 3 then
		    Pic.Draw (powerUpSpeed, powerUpX, powerUpY, picMerge)
		elsif powerUpType = 4 then
		    Pic.Draw (powerUpDoubleDamage, powerUpX, powerUpY, picMerge)
		end if
	    end if
	    %PowerUp Collision - Tank1 - If the tank's position is the same as the power ups, give them the power up (depending on which one it is)
	    if drawPowerUp = 1 then
		if tank1top >= powerUpY and tank1top <= powerUpY + 76 and tank1side1 >= powerUpX and tank1side1 <= powerUpX + 76 then
		    if powerUpType = 1 then
			tank1Health := tank1MaxHealth
		    elsif powerUpType = 2 then
			tank1MaxHealth := tank1MaxHealth + tank1MaxHealth div 2
			tank1Health := tank1MaxHealth
		    elsif powerUpType = 3 then
			tank1Speed := tank1Speed * 2
		    elsif powerUpType = 3 then
			bullet1Damage := bullet1Damage * 2
		    end if
		    drawPowerUp := 0
		    powerUpTimer := 0
		elsif tank1top >= powerUpY and tank1top <= powerUpY + 76 and tank1side2 >= powerUpX and tank1side2 <= powerUpX + 76 then
		    if powerUpType = 1 then
			tank1Health := tank1MaxHealth
		    elsif powerUpType = 2 then
			tank1MaxHealth := tank1MaxHealth + tank1MaxHealth div 2
			tank1Health := tank1MaxHealth
		    elsif powerUpType = 3 then
			tank1Speed := tank1Speed * 2
		    elsif powerUpType = 3 then
			bullet1Damage := bullet1Damage * 2
		    end if
		    drawPowerUp := 0
		    powerUpTimer := 0
		elsif tank1bottom >= powerUpY and tank1bottom <= powerUpY + 76 and tank1side2 >= powerUpX and tank1side2 <= powerUpX + 76 then
		    if powerUpType = 1 then
			tank1Health := tank1MaxHealth
		    elsif powerUpType = 2 then
			tank1MaxHealth := tank1MaxHealth + tank1MaxHealth div 2
			tank1Health := tank1MaxHealth
		    elsif powerUpType = 3 then
			tank1Speed := tank1Speed * 2
		    elsif powerUpType = 3 then
			bullet1Damage := bullet1Damage * 2
		    end if
		    drawPowerUp := 0
		    powerUpTimer := 0
		elsif tank1bottom >= powerUpY and tank1bottom <= powerUpY + 76 and tank1side1 >= powerUpX and tank1side1 <= powerUpX + 76 then
		    if powerUpType = 1 then
			tank1Health := tank1MaxHealth
		    elsif powerUpType = 2 then
			tank1MaxHealth := tank1MaxHealth + tank1MaxHealth div 2
			tank1Health := tank1MaxHealth
		    elsif powerUpType = 3 then
			tank1Speed := tank1Speed * 2
		    elsif powerUpType = 3 then
			bullet1Damage := bullet1Damage * 2
		    end if
		    drawPowerUp := 0
		    powerUpTimer := 0
		end if
	    end if
	    %PowerUp Collision - Tank2 - If the tank's position is the same as the power ups, give them the power up (depending on which one it is)
	    if drawPowerUp = 1 then
		if tank2top >= powerUpY and tank2top <= powerUpY + 76 and tank2side1 >= powerUpX and tank2side1 <= powerUpX + 76 then
		    if powerUpType = 1 then
			tank2Health := tank2MaxHealth
		    elsif powerUpType = 2 then
			tank2MaxHealth := tank2MaxHealth + tank2MaxHealth div 2
			tank2Health := tank2MaxHealth
		    elsif powerUpType = 3 then
			tank2Speed := tank2Speed * 2
		    elsif powerUpType = 3 then
			bullet2Damage := bullet2Damage * 2
		    end if
		    drawPowerUp := 0
		    powerUpTimer := 0
		elsif tank2top >= powerUpY and tank2top <= powerUpY + 76 and tank2side2 >= powerUpX and tank2side2 <= powerUpX + 76 then
		    if powerUpType = 1 then
			tank2Health := tank2MaxHealth
		    elsif powerUpType = 2 then
			tank2MaxHealth := tank2MaxHealth + tank2MaxHealth div 2
			tank2Health := tank2MaxHealth
		    elsif powerUpType = 3 then
			tank2Speed := tank2Speed * 2
		    elsif powerUpType = 3 then
			bullet2Damage := bullet2Damage * 2
		    end if
		    drawPowerUp := 0
		    powerUpTimer := 0
		elsif tank2bottom >= powerUpY and tank2bottom <= powerUpY + 76 and tank2side2 >= powerUpX and tank2side2 <= powerUpX + 76 then
		    if powerUpType = 1 then
			tank2Health := tank2MaxHealth
		    elsif powerUpType = 2 then
			tank2MaxHealth := tank2MaxHealth + tank2MaxHealth div 2
			tank2Health := tank2MaxHealth
		    elsif powerUpType = 3 then
			tank2Speed := tank2Speed * 2
		    elsif powerUpType = 3 then
			bullet2Damage := bullet2Damage * 2
		    end if
		    drawPowerUp := 0
		    powerUpTimer := 0
		elsif tank2bottom >= powerUpY and tank2bottom <= powerUpY + 76 and tank2side1 >= powerUpX and tank2side1 <= powerUpX + 76 then
		    if powerUpType = 1 then
			tank2Health := tank2MaxHealth
		    elsif powerUpType = 2 then
			tank2MaxHealth := tank2MaxHealth + tank2MaxHealth div 2
			tank2Health := tank2MaxHealth
		    elsif powerUpType = 3 then
			tank2Speed := tank2Speed * 2
		    elsif powerUpType = 3 then
			bullet2Damage := bullet2Damage * 2
		    end if
		    drawPowerUp := 0
		    powerUpTimer := 0
		end if
	    end if
	    %Win condition, depending on whoever reaches 0 health first
	    if tank1Health <= 0 then
		winner := 1
		exit
	    elsif tank2Health <= 0 then
		winner := 0
		exit
	    end if
	    %Accumulators, variables that constantly increase
	    spinTimer1 := spinTimer1 + 50
	    spinTimer2 := spinTimer2 + 50
	    bulletTimer1 := bulletTimer1 + 50
	    bulletTimer2 := bulletTimer2 + 50
	    if drawMine1 = 1 then
		mineTimer1 := mineTimer1 + 50
	    end if
	    if drawMine2 = 1 then
		mineTimer2 := mineTimer2 + 50
	    end if
	    powerUpTimer := powerUpTimer + 50
	    if explosionTimer1 >= 1 then
		explosionTimer1 += 50
	    end if
	    if explosionTimer2 >= 1 then
		explosionTimer2 += 50
	    end if
	    if explosionTimer1 >= 101 then
		explosionTimer1 := 0
	    end if
	    if explosionTimer2 >= 101 then
		explosionTimer2 := 0
	    end if
	    %Health bars - draw the health as an integer value, as well as a bar beside it
	    Draw.Text (intstr (tank1Health), 430, 914, healthFont, textColour)
	    Draw.Text (intstr (tank2Health), 937, 914, healthFont, textColour)
	    drawfillbox (1105, 925, 1304, 950, red)
	    if tank1Health >= 0 then
		drawfillbox (1105, 925, 1104 + tank2Health / tank2MaxHealth * 200 div 1, 950, green)
	    end if
	    drawfillbox (195, 925, 394, 950, red)
	    if tank1Health >= 0 then
		drawfillbox (195, 925, 194 + tank1Health / tank1MaxHealth * 200 div 1, 950, green)
	    end if

	    delay (50)
	    View.Update
	    %If the game just started, display a countdown message
	    if countDown = 1 then
		fork countDownSound
		delay (300)
		Font.Draw ("Ready", maxx div 2 - 110, 600, countDownFont, textColour)
		delay (700)
		fork countDownSound
		delay (300)
		Font.Draw ("Set", maxx div 2 - 60, 400, countDownFont, textColour)
		delay (700)
		fork countDownSound2
		delay (300)
		Font.Draw ("Go!", maxx div 2 - 60, 200, countDownFont, textColour)
		delay (700)
		countDown := 0
		%Start the ingame music
		fork inGame
	    end if
	    %Win messages, draws a different 'winner!' screen depending on who won
	end loop
	%play the vitory sound
	fork victory
	if winner = 0 then
	    winner := 2
	    cls
	    Pic.Draw (player1win, 0, 0, 0)
	    winCount1 += 1
	    delay (2000)
	elsif winner = 1 then
	    winner := 2
	    cls
	    Pic.Draw (player2win, 0, 0, 0)
	    winCount2 += 1
	    delay (2000)
	end if
	%start playing the menu music again
	fork startScreen
    end if
    Mouse.Where (mouseX, mouseY, mouseButton)
    %Options Button - If the user hovers their mouse over the button draw the side tanks
    if mouseX >= 541 and mouseX <= 977 and mouseY >= 401 and mouseY <= 526 then
	Pic.Draw (startScreenTank1, 379, 431, picMerge)
	Pic.Draw (startScreenTank2, 1007, 431, picMerge)
    end if
    %If the user clicks the button, enter the options screen
    if mouseX >= 541 and mouseX <= 977 and mouseY >= 401 and mouseY <= 526 and mouseButton = 1 then
	loop
	    Mouse.Where (mouseX, mouseY, mouseButton)
	    %Page 1 - if the page is 1, draw the screen corresponding to the first page
	    if optionsPage = 1 then
		Pic.Draw (optionsPage1, 0, 0, 0)
		%Change page buttons, if the user clicks the button, change the page to the next/previous page
		if mouseX >= 578 and mouseX <= 627 and mouseY >= 22 and mouseY <= 87 and mouseButton = 1 then
		    loop
			Mouse.Where (mouseX, mouseY, mouseButton)
			if mouseButton = 0 then
			    optionsPage := 2
			    exit
			end if
		    end loop
		elsif mouseX >= 928 and mouseX <= 977 and mouseY >= 22 and mouseY <= 87 and mouseButton = 1 then
		    loop
			Mouse.Where (mouseX, mouseY, mouseButton)
			if mouseButton = 0 then
			    optionsPage := 2
			    exit
			end if
		    end loop
		end if
		%Enable Powerups - If the mouse clicks the button, toggle the variable to determine whether or not power ups get used in the game
		if mouseX >= 425 and mouseX <= 475 and mouseY >= 595 and mouseY <= 655 and mouseButton = 1 then
		    loop
			Mouse.Where (mouseX, mouseY, mouseButton)
			if mouseButton = 0 then
			    if enablePowerUpConst = "No" then
				enablePowerUpConst := "Yes"
			    elsif enablePowerUpConst = "Yes" then
				enablePowerUpConst := "No"
			    end if
			    exit
			end if
		    end loop
		elsif mouseX >= 705 and mouseX <= 755 and mouseY >= 595 and mouseY <= 655 and mouseButton = 1 then
		    loop
			Mouse.Where (mouseX, mouseY, mouseButton)
			if mouseButton = 0 then
			    if enablePowerUpConst = "No" then
				enablePowerUpConst := "Yes"
			    elsif enablePowerUpConst = "Yes" then
				enablePowerUpConst := "No"
			    end if
			    exit
			end if
		    end loop
		end if
		%Bullet Speed - If the mouse clicks the button, change the variable to determine what the bullet speed is
		if mouseX >= 425 and mouseX <= 475 and mouseY >= 445 and mouseY <= 505 and mouseButton = 1 then
		    loop
			Mouse.Where (mouseX, mouseY, mouseButton)
			if mouseButton = 0 then
			    bulletSpeedConst := bulletSpeedConst - 10
			    exit
			end if
		    end loop
		end if
		if mouseX >= 705 and mouseX <= 755 and mouseY >= 445 and mouseY <= 505 and mouseButton = 1 then
		    loop
			Mouse.Where (mouseX, mouseY, mouseButton)
			if mouseButton = 0 then
			    bulletSpeedConst := bulletSpeedConst + 10
			    exit
			end if
		    end loop
		end if
		%Tank 1 Speed - If the mouse clicks the button, change the variable to determine the speed of tank1
		if mouseX >= 425 and mouseX <= 475 and mouseY >= 295 and mouseY <= 355 and mouseButton = 1 then
		    loop
			Mouse.Where (mouseX, mouseY, mouseButton)
			if mouseButton = 0 then
			    tank1SpeedConst := tank1SpeedConst - 10
			    exit
			end if
		    end loop
		elsif mouseX >= 705 and mouseX <= 755 and mouseY >= 295 and mouseY <= 355 and mouseButton = 1 then
		    loop
			Mouse.Where (mouseX, mouseY, mouseButton)
			if mouseButton = 0 then
			    tank1SpeedConst := tank1SpeedConst + 10
			    exit
			end if
		    end loop
		end if
		%Tank 2 Speed - If the mouse clicks the button, change the variable to determine the speed of tank2
		if mouseX >= 425 and mouseX <= 475 and mouseY >= 145 and mouseY <= 205 and mouseButton = 1 then
		    loop
			Mouse.Where (mouseX, mouseY, mouseButton)
			if mouseButton = 0 then
			    tank2SpeedConst := tank2SpeedConst - 10
			    exit
			end if
		    end loop
		elsif mouseX >= 705 and mouseX <= 755 and mouseY >= 145 and mouseY <= 205 and mouseButton = 1 then
		    loop
			Mouse.Where (mouseX, mouseY, mouseButton)
			if mouseButton = 0 then
			    tank2SpeedConst := tank2SpeedConst + 10
			    exit
			end if
		    end loop
		end if
		%Tank AutoTurn - If the mouse clicks the button, change the variable to determine whether or not the turret automatically rotates when moving
		if mouseX >= 1105 and mouseX <= 1155 and mouseY >= 595 and mouseY <= 655 and mouseButton = 1 then
		    loop
			Mouse.Where (mouseX, mouseY, mouseButton)
			if mouseButton = 0 then
			    if tankAutoTurnConst = "No" then
				tankAutoTurnConst := "Yes"
			    elsif tankAutoTurnConst = "Yes" then
				tankAutoTurnConst := "No"
			    end if
			    exit
			end if
		    end loop
		elsif mouseX >= 1360 and mouseX <= 1410 and mouseY >= 595 and mouseY <= 655 and mouseButton = 1 then
		    loop
			Mouse.Where (mouseX, mouseY, mouseButton)
			if mouseButton = 0 then
			    if tankAutoTurnConst = "No" then
				tankAutoTurnConst := "Yes"
			    elsif tankAutoTurnConst = "Yes" then
				tankAutoTurnConst := "No"
			    end if
			    exit
			end if
		    end loop
		end if
		%PowerUp Time - If the mouse clicks the button, change the variable to determine how long the power up takes to spawn
		if mouseX >= 1105 and mouseX <= 1155 and mouseY >= 445 and mouseY <= 505 and mouseButton = 1 then
		    loop
			Mouse.Where (mouseX, mouseY, mouseButton)
			if mouseButton = 0 then
			    powerUpSpawnTimeConst := powerUpSpawnTimeConst - 1000
			    exit
			end if
		    end loop
		elsif mouseX >= 1360 and mouseX <= 1410 and mouseY >= 445 and mouseY <= 505 and mouseButton = 1 then
		    loop
			Mouse.Where (mouseX, mouseY, mouseButton)
			if mouseButton = 0 then
			    powerUpSpawnTimeConst := powerUpSpawnTimeConst + 1000
			    exit
			end if
		    end loop
		end if
		%Bullet Damage - If the mouse clicks the button, change the variable to determine the damage the bullet deals
		if mouseX >= 1105 and mouseX <= 1155 and mouseY >= 295 and mouseY <= 355 and mouseButton = 1 then
		    loop
			Mouse.Where (mouseX, mouseY, mouseButton)
			if mouseButton = 0 then
			    bullet1DamageConst := bullet1DamageConst - 10
			    bullet2DamageConst := bullet2DamageConst - 10
			    exit
			end if
		    end loop
		elsif mouseX >= 1360 and mouseX <= 1410 and mouseY >= 295 and mouseY <= 355 and mouseButton = 1 then
		    loop
			Mouse.Where (mouseX, mouseY, mouseButton)
			if mouseButton = 0 then
			    bullet1DamageConst := bullet1DamageConst + 10
			    bullet2DamageConst := bullet2DamageConst + 10
			    exit
			end if
		    end loop
		end if
		%Mine Damage - If the mouse clicks the button, change the variable to determine the damage the mine
		if mouseX >= 1105 and mouseX <= 1155 and mouseY >= 145 and mouseY <= 205 and mouseButton = 1 then
		    loop
			Mouse.Where (mouseX, mouseY, mouseButton)
			if mouseButton = 0 then
			    mineDamageConst := mineDamageConst - 10
			    exit
			end if
		    end loop
		elsif mouseX >= 1360 and mouseX <= 1410 and mouseY >= 145 and mouseY <= 205 and mouseButton = 1 then
		    loop
			Mouse.Where (mouseX, mouseY, mouseButton)
			if mouseButton = 0 then
			    mineDamageConst := mineDamageConst + 10
			    exit
			end if
		    end loop
		end if

		%Drawing Variables - Draw the changing variable values on the options screen
		if enablePowerUpConst = "No" then
		    Draw.Text (enablePowerUpConst, 535, 595, optionsFont, white)
		elsif enablePowerUpConst = "Yes" then
		    Draw.Text (enablePowerUpConst, 525, 595, optionsFont, white)
		end if
		Draw.Text (intstr (bulletSpeedConst), 535, 445, optionsFont, white)
		Draw.Text (intstr (tank1SpeedConst), 535, 295, optionsFont, white)
		Draw.Text (intstr (tank2SpeedConst), 535, 145, optionsFont, white)
		if tankAutoTurnConst = "No" then
		    Draw.Text (tankAutoTurnConst, 1215, 595, optionsFont, white)
		elsif tankAutoTurnConst = "Yes" then
		    Draw.Text (tankAutoTurnConst, 1190, 595, optionsFont, white)
		end if
		Draw.Text (intstr (powerUpSpawnTimeConst div 1000), 1215, 445, optionsFont, white)
		Draw.Text (intstr (bullet1DamageConst), 1215, 295, optionsFont, white)
		Draw.Text (intstr (mineDamageConst), 1215, 145, optionsFont, white)
	    end if
	    %Page 2
	    if optionsPage = 2 then
		%If the mouse clicks the button, set the page back to 1
		Pic.Draw (optionsPage2, 0, 0, 0)
		if mouseX >= 578 and mouseX <= 627 and mouseY >= 30 and mouseY <= 85 and mouseButton = 1 then
		    loop
			Mouse.Where (mouseX, mouseY, mouseButton)
			if mouseButton = 0 then
			    optionsPage := 1
			    exit
			end if
		    end loop
		elsif mouseX >= 928 and mouseX <= 977 and mouseY >= 30 and mouseY <= 85 and mouseButton = 1 then
		    loop
			Mouse.Where (mouseX, mouseY, mouseButton)
			if mouseButton = 0 then
			    optionsPage := 1
			    exit
			end if
		    end loop
		end if
		%Mine Radius - If the mouse clicks the button, change the variable to determine the radius the mine
		if mouseX >= 425 and mouseX <= 475 and mouseY >= 595 and mouseY <= 655 and mouseButton = 1 then
		    loop
			Mouse.Where (mouseX, mouseY, mouseButton)
			if mouseButton = 0 then
			    mineRadiusConst := mineRadiusConst - 10
			    exit
			end if
		    end loop
		elsif mouseX >= 705 and mouseX <= 755 and mouseY >= 595 and mouseY <= 655 and mouseButton = 1 then
		    loop
			Mouse.Where (mouseX, mouseY, mouseButton)
			if mouseButton = 0 then
			    mineRadiusConst := mineRadiusConst + 10
			    exit
			end if
		    end loop
		end if
		%Mine Fuse Time - If the mouse clicks the button, change the variable to determine how long the mine takes until it blows up
		if mouseX >= 425 and mouseX <= 475 and mouseY >= 445 and mouseY <= 505 and mouseButton = 1 then
		    loop
			Mouse.Where (mouseX, mouseY, mouseButton)
			if mouseButton = 0 then
			    mineMaxTimeConst := mineMaxTimeConst - 1000
			    exit
			end if
		    end loop
		elsif mouseX >= 705 and mouseX <= 755 and mouseY >= 445 and mouseY <= 505 and mouseButton = 1 then
		    loop
			Mouse.Where (mouseX, mouseY, mouseButton)
			if mouseButton = 0 then
			    mineMaxTimeConst := mineMaxTimeConst + 1000
			    exit
			end if
		    end loop
		end if
		%Tank 1 Health - If the mouse clicks the button, change the variable to determine the health of tank 1
		if mouseX >= 1105 and mouseX <= 1155 and mouseY >= 595 and mouseY <= 655 and mouseButton = 1 then
		    loop
			Mouse.Where (mouseX, mouseY, mouseButton)
			if mouseButton = 0 then
			    tank1MaxHealthConst := tank1MaxHealthConst - 10
			    exit
			end if
		    end loop
		elsif mouseX >= 1360 and mouseX <= 1410 and mouseY >= 595 and mouseY <= 655 and mouseButton = 1 then
		    loop
			Mouse.Where (mouseX, mouseY, mouseButton)
			if mouseButton = 0 then
			    tank1MaxHealthConst := tank1MaxHealthConst + 10
			    exit
			end if
		    end loop
		end if
		%Tank 2 Health - If the mouse clicks the button, change the variable to determine the health of tank 2
		if mouseX >= 1105 and mouseX <= 1155 and mouseY >= 445 and mouseY <= 505 and mouseButton = 1 then
		    loop
			Mouse.Where (mouseX, mouseY, mouseButton)
			if mouseButton = 0 then
			    tank2MaxHealthConst := tank2MaxHealthConst - 10
			    exit
			end if
		    end loop
		elsif mouseX >= 1360 and mouseX <= 1410 and mouseY >= 445 and mouseY <= 505 and mouseButton = 1 then
		    loop
			Mouse.Where (mouseX, mouseY, mouseButton)
			if mouseButton = 0 then
			    tank2MaxHealthConst := tank2MaxHealthConst + 10
			    exit
			end if
		    end loop
		end if
		%Draw the changing variables
		Draw.Text (intstr (mineRadiusConst), 535, 595, optionsFont, white)
		Draw.Text (intstr (mineMaxTimeConst div 1000), 535, 445, optionsFont, white)
		Draw.Text (intstr (tank1MaxHealthConst), 1200, 595, optionsFont, white)
		Draw.Text (intstr (tank2MaxHealthConst), 1200, 445, optionsFont, white)
	    end if
	    Draw.Text ("Back", 10, 940, healthFont, white)
	    Draw.Text ("Reset", 1270, 940, healthFont, white)
	    %If the mouse clicks the button, exit the options screen
	    if mouseX >= 10 and mouseX <= 160 and mouseY >= 940 and mouseY <= 982 and mouseButton = 1 then
		exit
	    end if
	    %If the user clicks the reset button, run the procedure to change all of the variables back to their starting values
	    if mouseX >= 1270 and mouseX <= 1490 and mouseY >= 940 and mouseY <= 982 and mouseButton = 1 then
		resetOptions
	    end if
	    delay (50)
	    View.Update
	end loop
    end if
    %Controls Button - if the user hovers over the button, draw the side tanks
    if mouseX >= 427 and mouseX <= 1081 and mouseY >= 266 and mouseY <= 360 then
	Pic.Draw (startScreenTank1, 265, 266, picMerge)
	Pic.Draw (startScreenTank2, 1111, 266, picMerge)
    end if
    %if the mouse is clicked, enter the how to play screen
    if mouseX >= 427 and mouseX <= 1081 and mouseY >= 266 and mouseY <= 360 and mouseButton = 1 then
	loop
	    %Draw a specific controls page
	    if controlsPage = 2 then
		Pic.Draw (controlsScreen, 0, 0, 0)
	    elsif controlsPage = 1 then
		Pic.Draw (howToPlay, 0, 0, 0)
	    elsif controlsPage = 3 then
		Pic.Draw (powerUps, 0, 0, 0)
	    end if
	    %If the user clicks the previous page button, change the page
	    if mouseX >= 550 and mouseX <= 600 and mouseY >= 30 and mouseY <= 85 and mouseButton = 1 then
		loop
		    Mouse.Where (mouseX, mouseY, mouseButton)
		    if mouseButton = 0 then
			if controlsPage = 1 then
			    controlsPage := 3
			elsif controlsPage = 2 then
			    controlsPage := 1
			elsif controlsPage = 3 then
			    controlsPage := 2
			end if
			exit
		    end if
		end loop
		%if the user clicks the next page button, change the page
	    elsif mouseX >= 900 and mouseX <= 950 and mouseY >= 30 and mouseY <= 85 and mouseButton = 1 then
		loop
		    Mouse.Where (mouseX, mouseY, mouseButton)
		    if mouseButton = 0 then
			if controlsPage = 1 then
			    controlsPage := 2
			elsif controlsPage = 2 then
			    controlsPage := 3
			elsif controlsPage = 3 then
			    controlsPage := 1
			end if
			exit
		    end if
		end loop
	    end if
	    Mouse.Where (mouseX, mouseY, mouseButton)
	    Draw.Text ("Back", 10, 940, healthFont, white)
	    %Exit if the user clicks the exit button
	    Mouse.Where (mouseX, mouseY, mouseButton)
	    if mouseX >= 10 and mouseX <= 160 and mouseY >= 940 and mouseY <= 982 and mouseButton = 1 then
		exit
	    end if
	    delay (50)
	end loop
    end if
    %Exit Button - If the user wants to exit the game, hide the window and then crash it intentionally
    if mouseX >= 648 and mouseX <= 881 and mouseY >= 98 and mouseY <= 193 then
	Pic.Draw (startScreenTank1, 486, 98, picMerge)
	Pic.Draw (startScreenTank2, 911, 98, picMerge)
    end if
    if mouseX >= 648 and mouseX <= 881 and mouseY >= 98 and mouseY <= 193 and mouseButton = 1 then
	Window.Hide (defWinID)
	Window.Close (defWinID)
    end if
    Draw.Text (intstr (winCount1), 180, 800, healthFont, white)
    Draw.Text (intstr (winCount2), 1280, 800, healthFont, white)
    delay (50)
    View.Update
end loop
