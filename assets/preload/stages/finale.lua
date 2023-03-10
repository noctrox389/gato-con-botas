
function onCreate()
	makeAnimatedLuaSprite('fire','bg/bgFire',640,-640)
	scaleObject('fire', 1.4, 1.8)
	addAnimationByPrefix('fire','dance','bgFire idle',24,true)
	makeAnimatedLuaSprite('fire2','bg/bgFire',-340,-190)
	scaleObject('fire2', 1.1, 1.5)
	addAnimationByPrefix('fire2','dance','bgFire idle',24,true)
	
	makeLuaSprite('backColor','',-560,-390)
	makeGraphic('backColor',3000,1000,'191970')
	addLuaSprite('backColor',false)
	setProperty('backColor.alpha', 0.7)
	
	addLuaSprite('fire',true)
	addLuaSprite('fire2',true)
	setObjectOrder('backColor', 0)
	setObjectOrder('fire', 1)
	setObjectOrder('fire2', 2)

	makeLuaSprite('blackLine','',560,-470)
	makeGraphic('blackLine',120,1080,'000000')
	addLuaSprite('blackLine',true)

	
	makeLuaSprite('OPscreen1','bg/OPscreen1',0,-130)
	scaleObject('OPscreen1', 1.4, 1.4)
	setObjectCamera('OPscreen1','hud')
	setProperty('OPscreen1.alpha', 0.3)

	makeLuaSprite('OPscreen2','bg/OPscreen2',0,-130)
	scaleObject('OPscreen2', 1.4, 1.4)
	setObjectCamera('OPscreen2','hud')
	setProperty('OPscreen2.alpha', 0.3)

	makeLuaSprite('OPscreen3','bg/OPscreen3',0,-130)
	scaleObject('OPscreen3', 1.4, 1.4)
	setObjectCamera('OPscreen3','hud')
	setProperty('OPscreen3.alpha', 0.3)

	addLuaSprite('OPscreen1',false)
	addLuaSprite('OPscreen2',false)
	addLuaSprite('OPscreen3',false)

	makeLuaSprite('blackscreenOP','',0,0)
	makeGraphic('blackscreenOP',1280,720,'FFFFFF')
	setObjectCamera('blackscreenOP','hud')
	addLuaSprite('blackscreenOP',false)
	--close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end

function onUpdate()

end

function onStartCountdown()	
	triggerEvent('Camera Follow Pos','630','110')
	
	setProperty('OPscreen1.visible', false)
	setProperty('OPscreen2.visible', false)
	setProperty('OPscreen3.visible', false)
	setProperty('blackscreenOP.alpha', 0)
	setProperty('gf.alpha', 0)
	return Function_Continue
end

function onStepHit()
    if curStep == 256 then
		triggerEvent('Camera Follow Pos','990','110')
		setProperty('defaultCamZoom',1.3 ,3)
    end
    if curStep == 272 then
		triggerEvent('Camera Follow Pos','630','110')
		setProperty('defaultCamZoom',0.85 ,3)
    end
	
	if curStep >= 48 and curStep <= 64 then
		setProperty('OPscreen1.visible', true)
		setProperty('OPscreen2.visible', false)
		setProperty('OPscreen3.visible', false)
	end
	if curStep >= 64 and curStep <= 80 then
		setProperty('OPscreen1.visible', false)
		setProperty('OPscreen2.visible', true)
		setProperty('OPscreen3.visible', false)
	end
	if curStep >= 80 and curStep <= 128 then
		setProperty('OPscreen1.visible', false)
		setProperty('OPscreen2.visible', false)
		setProperty('OPscreen3.visible', true)
		
		if curStep >= 96 and curStep <= 128 then
			doTweenAlpha('blackscreenOP','blackscreenOP', 1, 8, 'circOut')
		end
	end
	if curStep >= 128  then
		setProperty('OPscreen1.visible', false)
		setProperty('OPscreen2.visible', false)
		setProperty('OPscreen3.visible', false)
		setProperty('blackscreenOP.visible', false)
	end
	--hudAlpha()
end

function hudAlpha()
	if curStep >= 1696 and curStep <= 1823 then	
		doTweenAlpha('iconP1','iconP1', 0, 10, 'circOut')
		doTweenAlpha('iconP2','iconP2', 0, 10, 'circOut')
	end
	if curStep == 1824 then	
		doTweenAlpha('iconP1','iconP1', 1, 0.1, 'circOut')
		doTweenAlpha('iconP2','iconP2', 1, 0.1, 'circOut')
	end
end