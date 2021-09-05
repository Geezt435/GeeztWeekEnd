function start (song)
    print("successfully played song Mossy March AKA Overgrown")
end

function update (elapsed)
    tweenCameraZoom(1.6,(crochet * 4) / 1000)
end

function beatHit (beat)

end

function stepHit (beat)
    if curStep == 40 then
        resizeWindow(getScreenWidth() / 1.5, getScreenHeight() / 1.5)
        setWindowPos(getScreenWidth() / 6, getScreenHeight() / 6);
    end
end

function keyPressed (key)
    if key == "left" and getWindowX() > 0 then
        setWindowPos(getWindowX() - 33, getWindowY());
    end
    if key == "right" and (getWindowWidth() + getWindowX()) < getScreenWidth() then
        setWindowPos(getWindowX() + 33, getWindowY());
    end
    if key == "up" and getWindowY() > 0 then
        setWindowPos(getWindowX(), getWindowY() - 33);
    end
    if key == "down" and (getWindowHeight() + getWindowY()) < getScreenHeight() then
        setWindowPos(getWindowX(), getWindowY() + 33);
    end	
end

function playerTwoSing()
    setCamZoom(1.7,(crochet * 4) / 1000)
    FlxG.camera.shake(0.5, 0.5);
end

function playerOneSing()
    setCamZoom(1.7,(crochet * 4) / 1000)
end

function playerTwoTurn()
    showOnlyStrums = true;
end

function playerOneTurn()
    showOnlyStrums = false;
end