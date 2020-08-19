///Turn at ledge script
var hVar;
hVar = argument0;
var solidCollsision;
solidCollision = isGround();
if ( argument0 == 0 )
{
    hVar = 15;
}
else if ( argument0 == "sprite" )
{
    hVar = sprite_height-1;
}
else
{
    hVar = argument0;
}

if (onGround)
{
    if (!hasTurned)
    {
        //Right
        if (vx > 0 && (!collision_rectangle(bbox_right,bbox_bottom-1,bbox_right,bbox_bottom+hVar,solidCollision,0,0) ) )
        {
                vx = 0;
                hasTurned = true;
                alarm[0] = 3;
        }
        //Left
        if (vx < 0 && !collision_rectangle(bbox_left,bbox_bottom-1,bbox_left,bbox_bottom+hVar,solidCollision,0,0))
        {
            vx = 0;
            hasTurned = true;
            alarm[0] = 3;
        }
    }
}
