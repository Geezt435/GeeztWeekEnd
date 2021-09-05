function start (song)
    print("successfully played song Bioluminescent")
end

function update (elapsed)
    tweenCameraZoom(1.6,(crochet * 4) / 1000)
end

function beatHit (beat)

end

function stepHit (beat)

end

function keyPressed (key)

end

function playerTwoTurn()
    showOnlyStrums = false;
end

function playerOneTurn()
    showOnlyStrums = true;
end

function playerTwoSing()
    setCamZoom(1.65,(crochet * 4) / 1000)
end

function playerOneSing()
    setCamZoom(1.65,(crochet * 4) / 1000)
end