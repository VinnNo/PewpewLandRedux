if ( instance_exists(oGame) && instance_exists(oPlayer) )
{
    if ( frozen == false )
    {
        if ( hp >= 0 )
        {
            canMove = true;
        }
    }
}
else
{
    canMove = false;
}


