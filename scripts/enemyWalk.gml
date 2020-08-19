var moveSpeed, moveDir, moveVar;

moveSpeed       = argument0; //Max speed
moveDir         = argument1; //Direction(left/right)
moveVar         = argument2; //The variable (eg. vx or h )

if (!place_meeting(x + moveDir, y, oParSolid)
    && !place_meeting(x + moveDir, y, oEnBlocker) )
    {
        moveVar = moveDir * moveSpeed;
        x += moveVar;
    }
    else
    {
        moveVar = 0;
    }
    
    if (moveVar == 0)
    {
        if ( place_meeting(x + 1, y, oParSolid) 
        && place_meeting(x - 1, y, oParSolid) )
        {
            image_speed=0;
        }
        else
        {
            moveDir = -moveDir;
        }
    }
    else if ( moveVar != 0 )
{
    if ( moveVar > moveSpeed )
    {
        moveVar = moveSpeed;
    }
    else if ( moveVar < moveSpeed )
    {
        moveVar = -moveSpeed;
    }
    //x += moveVar;
}
