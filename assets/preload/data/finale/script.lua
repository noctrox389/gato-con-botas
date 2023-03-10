healthLostValue = 0
hudAlpha = 0

function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.3 then
        setProperty('health', health - healthLostValue);
    end
end

function onStartCountdown()	
	setProperty('iconP1.alpha', hudAlpha)
	setProperty('iconP2.alpha', hudAlpha)
	setProperty('timeBarBG.alpha', hudAlpha)
	setProperty('timeBar.alpha', hudAlpha)
	setProperty('healthBar.alpha', hudAlpha)
	setProperty('healthBarBG.alpha', hudAlpha)
	setProperty('timeTxt.alpha', hudAlpha)
	setProperty('scoreTxt.alpha', hudAlpha)
	for i = 0,7 do
		setPropertyFromGroup('strumLineNotes', i, 'alpha', hudAlpha)
	end
	
	setProperty('timeBarBG.visible', false)
	setProperty('timeBar.visible', false)
	setProperty('timeTxt.visible', false)
	setProperty('strumLineNotes.visible', false)
	return Function_Continue
end

function onStepHit()
	setProperty('iconP1.alpha', hudAlpha)
	setProperty('iconP2.alpha', hudAlpha)
	setProperty('timeBarBG.alpha', hudAlpha)
	setProperty('timeBar.alpha', hudAlpha)
	setProperty('healthBar.alpha', hudAlpha)
	setProperty('healthBarBG.alpha', hudAlpha)
	setProperty('timeTxt.alpha', hudAlpha)
	setProperty('scoreTxt.alpha', hudAlpha)
	for i = 0,7 do
		setPropertyFromGroup('strumLineNotes', i, 'alpha', hudAlpha)
	end
	if curStep >= 104 then
		setProperty('timeBarBG.visible', true)
		setProperty('timeBar.visible', true)
		setProperty('timeTxt.visible', true)
		setProperty('strumLineNotes.visible', true)
	
		HUDON()
	end
	
    if curStep <= 272 then
	    healthLostValue = 0.02
    end
    if curStep == 272 then
        setProperty('health', 1);
    end
    if curStep >= 272 and curStep <= 1440 then
	    healthLostValue = 0.008
    end
    if curStep == 1440 then
        setProperty('health', 1);
    end
    if curStep >= 1440 and curStep <= 1824 then
	    healthLostValue = 0.0015
    end
    if curStep >= 1824 then
	    healthLostValue = 0
    end
end

function HUDOFF()
	if hudAlpha >= 0 then
		hudAlpha = hudAlpha - 0.1
	end
end

function HUDON()
	if hudAlpha <= 1 then
		hudAlpha = hudAlpha + 0.1
	end
end