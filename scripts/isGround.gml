/// OnGround();

if place_meeting(x, y + 1, oParSolid) 
{
    return oParSolid;
}
else if (place_meeting(x, y + 1, oParJumpThru ) && !place_meeting(x, y, oParJumpThru) )
{
    return oParJumpThru;
}
