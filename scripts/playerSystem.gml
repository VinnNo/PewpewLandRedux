/// Movement

// Input //////////////////////////////////////////////////////////////////////

playerGetInput();

// Movement ///////////////////////////////////////////////////////////////////

// Apply the correct form of acceleration and friction
var tempAccel, tempFric;

if (onGround) {  
    tempAccel = groundAccel;
    tempFric  = groundFric;
} else {
    tempAccel = airAccel;
    tempFric  = airFric;
}

// Wall cling to avoid accidental push-off
if ((!cRight && !cLeft) || onGround) {
    canStick = true;
    sticking = false;
} else if (((kRight && cLeft) || (kLeft && cRight)) && canStick && !onGround) {
    alarm[0] = clingTime;
    sticking = true; 
    canStick = false;       
}

// Handle gravity
if ( state != DASH ) {
if (!onGround) 
{
    if ((cLeft || cRight) && vy >= 0) 
    {
        // Wall slide
        vy = Approach(vy, vyMax * 0.33, gravSlide);
    } 
    else 
    {
        // Fall normally
        if (vy < 0)
            vy = Approach(vy, vyMax, gravRise);
        else
            vy = Approach(vy, vyMax, gravFall);
    }
}

} // End Dash check

if ( state != ROLL && state != DASH) {
// Left 
if (kLeft && !kRight && !sticking) {
    facing = LEFT;
    state  = RUN;
    
    // Apply acceleration left
    if (vx > 0)
        vx = Approach(vx, 0, tempFric);   
    vx = Approach(vx, -vxMax, tempAccel);
// Right
} else if (kRight && !kLeft && !sticking) {
    facing = RIGHT;
    state  = RUN;
    
    // Apply acceleration right
    if (vx < 0)
        vx = Approach(vx, 0, tempFric);   
    vx = Approach(vx, vxMax, tempAccel);
}
/*
if (kLeft && vx >= 0
|| kRight && vx <= 0 )
{
    skid = true;
}
else
{
    skid = false;
}
*/

// Friction
if (!kRight && !kLeft) {
    vx    = Approach(vx, 0, tempFric);
    state = IDLE;
} 

} //end the ROLL check

// Wall jump
if (kJump && cLeft && !onGround) {   
    xscale = 0.75;
    yscale = 1.25;
                    
    for (var i = 0; i < 4; i++)
        instance_create(bbox_left, random_range(bbox_top, bbox_bottom), oFxDust);
                 
    // Wall jump is different when pushing off/towards the wall        
    if (kLeft) {
        vx = jumpHeight * .75;
        vy = -jumpHeight * 1.1;
    } else {
        vx = vxMax;    
        vy = -jumpHeight * 1.1;
    }  
} else if (kJump && cRight && !onGround) {   
    xscale = 0.8;
    yscale = 1.2;

    for (var i = 0; i < 4; i++)
        instance_create(bbox_right, random_range(bbox_top, bbox_bottom), oFxDust);
                               
    // Wall jump is different when pushing off/towards the wall  
    if (kRight) {
        vx = -jumpHeight * .75;
        vy = -jumpHeight * 1.1;
    } else {
        vx = -vxMax;    
        vy = -jumpHeight * 1.1;
    }  
}

// Jump 
if (kJump) {
    // THIS LINE HAS BEEN EDITED TO ALLOW FOR MULTI JUMPS 
    if (1) {//onGround) {
        // Fall thru platform
        if (kDown) && (place_meeting(x, y + 1, oParJumpThru) && !place_meeting(x, y + 1, oParSolid)) {
                ++y;
        // Normal jump
        } else {
            xscale = 0.5;
            yscale = 1.5;
            
            for (var i = 0; i < 4; i++)
                instance_create(random_range(bbox_left, bbox_right), bbox_bottom, oFxDust);
            
            vy = -jumpHeight;
        }
    }
// Variable jumping
} else if (kJumpRelease) { 
    if (vy < 0 && vy >= -jumpHeight)
        vy *= 0.25;
}

// Jump state check
if (!onGround && state != DASH ) 
{
    state = JUMP;
    
    if (cLeft)
        facing = 1;
    if (cRight)
        facing = -1;
}

// Roll
if (onGround && !attacking) 
{
    if (state != ROLL) 
    {
        if (kRoll && kDown && isDucking) 
        {   
            image_index  = 0;
            image_speed  = 0.5;
            //sprite_index = sTwiggyBall;
            mask_index = sTwiggyDuckMask;
            if ( skid )
            skid = false;
            
            state = ROLL;
        }
    }

// Roll speed
    if (state == ROLL) 
    {
        vx = facing * 6;
    
        // Break out of roll
        if (!onGround || (cLeft || cRight)) 
        {
            state = IDLE;
            if (!attacking)
                alarm[1] = -1;
        }
    }
}

// Dash
if ( !attacking && canDash) 
{
    if (state != ROLL || state != DASH) 
    {
        if (kRoll && !kDown) 
        {   
            image_index  = 0;
            image_speed  = 0
            sprite_index = sTwiggyDash;
            //mask_index = sTwiggyDuckMask;
            vy = 0;
            canDash = false;
            if ( skid )
            skid = false;
            
            state = DASH;
            alarm[6] = 8;
        }
    }

// Dash speed
    if (state == DASH) 
    {
        vx = facing * 6;
    
        // Break out of roll
        if (cLeft || cRight) 
        {
            state = IDLE;
            if (!attacking)
                alarm[1] = -1;
        }
    }
}
/*
if (kAction)
{
    if (!attacking && !cLeft && !cRight ) 
    {
        if ( attackCombo == true )
        {
            attackCount = 1;
            atackCombo = false;
        }
        playerMeleeSystem();
    }
}

if (kMagicHeld)
{
    if (!usingMagic && !cLeft && !cRight )
    {
        playerMagicSystem();
    }
}
