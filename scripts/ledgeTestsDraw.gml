///Turn at ledge script
var wVar, hVar;
wVar = sprite_width/4;
hVar = sprite_height-1;


if (onGround)
{
        //Right
        if (vx > 0 )
        {
            draw_set_colour(c_yellow);
            draw_rectangle(bbox_right,bbox_bottom-1,bbox_right,bbox_bottom+hVar, false);
        }
        //Left
        if (vx < 0 )
        {
            draw_set_colour(c_red);
            draw_rectangle(bbox_left,bbox_bottom-1,bbox_left,bbox_bottom+hVar, false);
        }
}
