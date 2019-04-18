global.gameOver = false;
global.gameScore = 0;
global.gameTime = 0;
global.gameReady = false;
global.gameReadyCtr = 120;
global.gameHiScoreGot = false;
global.settingsUpdated = false;

global.intro = false;
global.introPanReady = false;
global.introState = 0;

if (instance_exists(oGAMER))
{
    with (oGAMER)
    {
        instance_destroy(id);
    }
}

if (instance_exists(oPIZZA))
{
    with (oPIZZA)
    {
        quipDelayT = 60;
        quipT = 0;
        quipIdx = 0;
        quipPool = QUIP_INTRO1;
        quipCurrent = quipPool[quipIdx];
        quipDone = false;
    
        dead = false;
        deadCtr = 60;
        life = 3;
    }
}

if (instance_exists(oPLR))
{
    with (oPLR)
    {
        dead = false;
        deadBounce = 0;
        
        image_angle = 0;
        x = room_width >> 1;
        y = GROUND_Y;
        vx = 0;
        vy = 0;
    }
}

//pan_reset();

if (!global.introDone)
{
    global.intro = true;
    //instance_destroy(oPAN);
}
instance_destroy(oPAN);
