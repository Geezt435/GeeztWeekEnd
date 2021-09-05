function start (song)
    print("successfully played song Jeez")
end

function update (elapsed)
    tweenCameraZoom(1,(crochet * 4) / 1000)
end

function beatHit (beat)

end

function stepHit (beat)
    if curStep == 256 then
        resizeWindow(getScreenWidth(), getScreenHeight())
        setWindowPos(0, 0);
    end
    if curStep == 351 then
        resizeWindow(getScreenWidth() / 1.5, getScreenHeight() / 1.5)
        setWindowPos(getScreenWidth() / 6, getScreenHeight() / 6);
    end
end

function keyPressed (key)

end

function playerTwoSing()
    setCamZoom(1.01,(crochet * 2) / 1000)
end

function playerOneSing()
    setCamZoom(1.01,(crochet * 2) / 1000)
end

function playerTwoTurn()
    showOnlyStrums = true;
end

function playerOneTurn()
    showOnlyStrums = false;
end