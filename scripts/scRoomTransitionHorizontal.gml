with (oCamera)
{
    instance_destroy();
}

with (oPlayer)
{
    targetRoom = transitionID.targetRoom;
    if (transitionID.targetYDiff == 0)
    {
        transY = y;
    }
    else
    {
        transY = transitionID.targetYDiff;
    }
    room_goto(targetRoom);
    x = transitionID.targetX
    y = transY;
    startXPos = x;
    startYPos = y;
    alarm[6] = 1;
}

with (oGame)
{
    x=0;
    y=0;
    alarm[1] = 1;
}

with (oMoonProp)
{
    x = xstart;
    y = ystart;
}
