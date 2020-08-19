//Arguments





// Movement ///////////////////////////////////////////////////////////////////
onGround = OnGround();

// Apply the correct form of acceleration and friction
var tempAccel, tempFric;

if (onGround) 
{  
    tempAccel = groundAccel;
    tempFric  = groundFric;
} 
else 
{
    tempAccel = airAccel;
    tempFric  = airFric;
}


// Handle gravity
if (!onGround) 
{
// Fall normally
if (vy < 0)
    vy = Approach(vy, vyMax, gravRise);
else
    vy = Approach(vy, vyMax, gravFall);
}

// Left 
if (kLeft && !kRight) 
{
    facing = LEFT;
    actionState  = RUN;
    
    // Apply acceleration left
    if (vx > 0)
        vx = Approach(vx, 0, tempFric);   
    vx = Approach(vx, -vxMax, tempAccel);
}    
// Right
else if (kRight && !kLeft) 
{
    facing = RIGHT;
    actionState  = RUN;
    
    // Apply acceleration right
    if (vx < 0)
        vx = Approach(vx, 0, tempFric);   
    vx = Approach(vx, vxMax, tempAccel);
}

// Friction
if (!kRight && !kLeft) 
{
    vx    = Approach(vx, 0, tempFric);
    actionState = STAND;
} 

// Wall jump
if (kJump && !onGround) 
{   
    xscale = 0.5;
    yscale = 1.5;
                    
    for (var i = 0; i < 4; i++)
        instance_create(bbox_left, random_range(bbox_top, bbox_bottom), oFxDust);
                 
    // Wall jump is different when pushing off/towards the wall        
    if (kLeft) 
    {
        vx = jumpHeight * .75;
        vy = -jumpHeight * 1.1;
    } 
    else 
    {
        vx = vxMax;    
        vy = -jumpHeight * 1.1;
    }  
} 
else if (kJump && !onGround) 
{   
    xscale = 0.5;
    yscale = 1.5;

    for (var i = 0; i < 4; i++)
        instance_create(bbox_right, random_range(bbox_top, bbox_bottom), oFxDust);
                               
    // Wall jump is different when pushing off/towards the wall  
    if (kRight) 
    {
        vx = -jumpHeight * .75;
        vy = -jumpHeight * 1.1;
    }
    else 
    {
        vx = -vxMax;    
        vy = -jumpHeight * 1.1;
    }  
}

// Jump 
if (kJump) 
{
    if (onGround) {
        // Fall thru platform
        if (kDown) && (place_meeting(x, y + 1, oParJumpThru) 
        && !place_meeting(x, y + 1, oParSolid)) 
        {
                ++y;
        // Normal jump
        }
        else
        {
            xscale = 0.5;
            yscale = 1.5;
            
            for (var i = 0; i < 4; i++)
                instance_create(random_range(bbox_left, bbox_right), bbox_bottom, oFxDust);
            
            vy = -jumpHeight;
        }
    }
// Variable jumping
} 
else if (kJumpRelease) 
{ 
    if (vy < 0 && vy >= -jumpHeight)
        vy *= 0.25;
}

// Jump state check
if (!onGround) 
{
    actionState = JUMP;
}
