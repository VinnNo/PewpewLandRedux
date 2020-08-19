with (oCamera)
{
    instance_destroy();
}

with (oPlayer)
{
    targetRoom = transitionID.targetRoom;
    transX = x;
    room_goto(targetRoom);
    x = transX
    y = transitionID.targetY;
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
