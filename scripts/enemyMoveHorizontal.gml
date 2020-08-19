//
var moveSpeed, moveDir, moveVar;

moveSpeed       = argument0; //Max speed
moveDir         = argument1; //Direction(left/right)
moveVar         = argument2; //The variable (eg. vx or h )

//Stop movement if there's a collision
if ( place_meeting(x + moveDir, y, oParSolid) )
{
    moveDir = -moveDir;
}
//Continue if there isn't a collision
if ( !place_meeting(x + moveDir, y, oParSolid) )
{
    moveVar += moveSpeed*moveDir;
}

//Limit Speeds then apply
if ( moveVar != 0 )
{
    if ( moveVar > moveSpeed )
    {
        moveVar = moveSpeed;
    }
    else if ( moveVar < moveSpeed )
    {
        moveVar = -moveSpeed;
    }
    x += moveVar;
}
