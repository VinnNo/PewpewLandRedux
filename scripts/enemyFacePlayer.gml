// 0 or nothing faces the player while 1 turns away.

if ( instance_exists(oPlayer) )
{
    if ( argument0 == 0  )
    {
        if (oPlayer.x > x )
        {
            image_xscale = 1;
        }
        else
        {
            image_xscale = -1;
        }
    }
    else if ( argument0 == 1 )
    {
        if ( oPlayer.x > x )
        {
            image_xscale = -1;
        }
        else
        {
            image_xscale = 1;
        }
    }
}
