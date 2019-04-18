if (!global.intro)
{
    global.intro = true;
    global.introPanReady = false;
    global.introState = 0;
    
    // remove pan
    if (instance_exists(oPAN))
        instance_destroy(oPAN);
    
    global.gameReady = false;
    global.gameReadyCtr = 120;
    global.gameTime = 0;
    
    with (oPIZZA)
    {
        quipDelayT = 60;
        quipT = 0;
        quipIdx = 0;
        quipPool = QUIP_INTRO1;
        quipCurrent = quipPool[quipIdx];
        quipDone = false;
    }
}
