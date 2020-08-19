///EnMikeySystem(Jumper, percent, LedgeWalker, Height(inBlocks), JumpUpLedge, Height(inBlocks, JumpOverGaps, length(inBlocks))

var solidCollsision;
solidCollision = isGround();
var blockCount;
blockCount = 16;

//Random Jumper
if ( argument0 == 1 )
{
    //Chance
    if (random(100) > argument1 )
    {
        if ( kJump == false && onGround )
        {
            kJump = true;
        }
    }
}

//Ledge Bottom
if ( argument2 == 1 )
{
    var vVar = argument3;
    if ( argument3 == 0 )
    {
        vVar = -15;
    }
    
    if (onGround)
    {
        if (!hasTurned)
        {
            //Right
            if (vx > 0 && (!collision_rectangle(bbox_right,bbox_bottom-1,bbox_right,bbox_bottom+vVar,solidCollision,0,0) ) )
            {
                    vx = 0;
                    hasTurned = true;
                    alarm[0] = 3;
            }
            //Left
            if (vx < 0 && !collision_rectangle(bbox_left,bbox_bottom-1,bbox_left,bbox_bottom+vVar,solidCollision,0,0))
            {
                vx = 0;
                hasTurned = true;
                alarm[0] = 3;
            }
        }
    }
}

//Ledge Top
if ( argument4 == 1 )
{
    var varV = argument5;
    if ( argument5 == 0 )
    {
        varV = 17;
    }
    
    if (onGround)
    {
        if (!hasTurned)
        {
            //Right
            if (vx > 0 && (!collision_rectangle(bbox_right,bbox_bottom-1,bbox_right,bbox_top-varV, solidCollision,0,0) ) )
            {
                vy = -jumpHeight;
            }
            //Left
            if (vx < 0 && !collision_rectangle(bbox_left,bbox_bottom-1,bbox_left,bbox_top-varV, solidCollision,0,0))
            {
                vy = -jumpHeight;
            }
        }
    }
}

//Gap Hop
if ( argument6 == 1 )
{
    var hVar = argument7*blockCount;
    if ( argument7 == 0 )
    {
        hVar = 16;
    }
    gapJump = jumpHeight + argument7*m;
    if (onGround)
    {
        if (!hasTurned)
        {
            //Right
            if (vx > 0 && (!collision_rectangle(bbox_right+hVar,bbox_bottom-1,bbox_right,bbox_bottom-15, solidCollision,0,0) ) )
            {
                vy = -jumpHeight;
            }
            //Left
            if (vx < 0 && !collision_rectangle(bbox_left-hVar,bbox_bottom-1,bbox_left,bbox_bottom-15, solidCollision,0,0))
            {
                vy = -jumpHeight;
            }
        }
    }
}
