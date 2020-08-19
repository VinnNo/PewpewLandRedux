///System Step (regular)
// Declare Temp Variables /////////////////////////////////////////////////////
//var kLeft, kRight, kUp, kDown, kJump, kJumpRelease, kAction, kBlock, kRollL, kRollR, tempAccel, tempFric;
/*
kLeft        = keyboard_check(vk_left)  || gamepad_axis_value(0, gp_axislh) < -0.4;
kRight       = keyboard_check(vk_right) || gamepad_axis_value(0, gp_axislh) >  0.4;
kUp          = keyboard_check(vk_up)    || gamepad_axis_value(0, gp_axislv) < -0.4;
kDown        = keyboard_check(vk_down)  || gamepad_axis_value(0, gp_axislv) >  0.4;

kJump        = keyboard_check_pressed(ord('Z'))  || gamepad_button_check_pressed(0, gp_face1);
kJumpRelease = keyboard_check_released(ord('Z')) || gamepad_button_check_released(0, gp_face1);

kAction      = keyboard_check_pressed(ord('X'))  || gamepad_button_check_pressed(0, gp_face3);
kBlock       = keyboard_check(ord('C'))          || gamepad_button_check(0, gp_face2);
kRollL       = keyboard_check_pressed(ord('A'))  || gamepad_button_check_pressed(0, gp_shoulderlb);
kRollR       = keyboard_check_pressed(ord('D'))  || gamepad_button_check_pressed(0, gp_shoulderrb);
*/

playerGetInput();
///////////////////////////////////////////////////////////////////////////////

// Which form of accel/fric to apply
if (onGround) 
{
    if (bLeft && h < 0 || bRight && h > 0)
    {
        tempAccel = pushBlockAccel;
        tempFric  = pushBlockFric;
    }
    else
    {
        tempAccel = groundAccel;
        tempFric  = groundFric;
    }
} 
else 
{
    tempAccel = airAccel;
    tempFric  = airFric;
}

// Stick to wall //////////////////////////////////////////////////////////////
if ((!cRight && !cLeft) || onGround) {
    canStick = true;
    sticking = false;
}   

// Cling to wall
if (((kRight && cLeft) || (kLeft && cRight)) && kJump && canStick && !onGround) {
    alarm[0] = clingTime;
    sticking = true; 
    canStick = false;       
}
///////////////////////////////////////////////////////////////////////////////

// Gravity ////////////////////////////////////////////////////////////////////
if (!onGround) {
    state = JUMP;
    if ((cLeft || cRight) && v >= 0) {
        // Wall slide
        v = Approach(v, maxV, gravSlide);
    } else {
        
        // Fall normally
        if (v < 0)
            v = Approach(v, maxV, gravRise);
        else
            v = Approach(v, maxV, gravFall);
    }
}
///////////////////////////////////////////////////////////////////////////////

// Left 
if (kLeft && !kRight && !sticking) 
{
    facing = LEFT;

    // Apply acceleration left
    if (h > 0)
        h = Approach(h, 0, tempFric);   
        h = Approach(h, -maxH, tempAccel);
        
    if (onGround /*&& !cLeft*/)
    {
        state = RUN;
    }
    else 
    {
        if (onGround)
            state = IDLE;
    }
}

// Right 
if (kRight && !kLeft && !sticking) {
    facing = RIGHT;

    // Apply acceleration right
    if (h < 0)
        h = Approach(h, 0, tempFric);   
    h = Approach(h, maxH, tempAccel);
        
    if (onGround /*&& !cRight*/)
        state = RUN;
    else {
        if (onGround)
            state = IDLE;
    }
}

// Friction
if (!kRight && !kLeft)
    h = Approach(h, 0, tempFric);

if (onGround && h == 0)
    state = IDLE;    
       
// Wall jump
if (kJump && kLeft && cLeft && !onGround) {
    // Stretch sprite
    xscale = 0.66;
    yscale = 1.33;     
    
    // Particles
    var i;
    for (i = 0; i < 4; ++i)
        with (instance_create(x + random_range(-8, 8), bbox_bottom, oParticle))
            direction = random_range(-45, 45);        
    
    // Wall jump is different when pushing off/towards the wall        
    if (kLeft) {
        v = -jumpHeight * 1.1;
        h = jumpHeight * .75  * 1.2;
    } else {
        v = -jumpHeight * 1.1;
        h = maxH;
    }

audio_play_sound(aWallClimb, 0, false);
}

if (kJump && kRight && cRight && !onGround) {
    // Stretch sprite
    xscale = 0.66;
    yscale = 1.33;              
     
    // Particles
    var i;
    for (i = 0; i < 4; ++i)
        with (instance_create(x + random_range(-8, 8), bbox_bottom, oParticle))
            direction = 180 + random_range(-45, 45);     
       
    // Wall jump is different when pushing off/towards the wall  
    if (kRight) {
        v = -jumpHeight * 1.1;
        h = -jumpHeight * .75 * 1.2;
    } else {
        v = -jumpHeight * 1.1;
        h = -maxH;
    }  
}
  
// Jump
if (kJump) 
{
    if (onGround || (skillDoubleJump && jumpCount < jumpMax))
    {
        if (onGround || (!cRight && !cLeft)&& jumpCount == 0) 
        {
            // Stretch sprite 
            xscale = 0.66;
            yscale = 1.33;
        
            // Particles
            var i;
            for (i = 0; i < 2; ++i)
                with (instance_create(x + random_range(-8, 8), bbox_bottom, oParticle))
                    direction = 90 + random_range(-45, 45);        
        }
        if (!onGround && skillDoubleJump && (jumpCount < jumpMax && jumpCount > 0))
        {
            // Stretch sprite 
            xscale = 0.66;
            yscale = 1.33;
            
            //Particles
            var i;
            for (i = 0; i < 6; ++i)
                with (instance_create(x + random_range(-8, 8), bbox_bottom, oMagicParticleR))
                    direction = 90 + random_range(-45, 45);
            
               
            jumpCount += 1;
            v = -jumpHeight;
            state = JUMP;
        }
        if (skillDoubleJump)
        {
            if (!onGround)
            {
                if (jumpCount < jumpMax && jumpCount > 0)
                {
                    v = -doubleJumpHeight;
                    state = JUMP;
                }
            }
            else
            {
                v = -jumpHeight;
                state = JUMP;
            }
            jumpCount += 1; 
        }
        else
        {
            v = -jumpHeight;
            state = JUMP;
        }
    } 
    else 
    {
        // Variable hop
        if (kJumpRelease) 
        {
            if (v < 0 && v >= -jumpHeight)
            v *= 0.25; 
        }
    }
}

// Swap facing on walls
if (!onGround) {
    if (cLeft)
        facing = RIGHT;
    if (cRight)
        facing = LEFT;
}

if (kActionHeld)
{
    if (charging == true)
    {
        chargeTimer += 1;
        attackPlusTimer +=1;
        if ( chargeTimer == chargeTimerMax )
        {
            magicDustPoof();
            magicDustPoof();
            isCharged = true;
            charging = false;
            chargeTimer = 0;
            chargingPitch = 1;
            var SND;
            {
                SND = audio_play_sound(aIsCharged2, 0, false);
                audio_sound_gain(SND, 0.65, 0);
                audio_sound_pitch(SND, 0.65);
                //audio_sound_gain(SND, 0, 1000);
            }
            
        }
        else if (attackPlusTimer == attackPlusTimerMax)
        {
            if (player_STATS_MANA > 0 )
            {
                player_STATS_MANA -= 1;
                attDamage += 1;
                if ( chargeTimer != chargeTimerMax )
                { 
                    if (chargingPitch == 1)
                    {
                        chargingPitch = 1.3;
                    }
                    else if ( chargingPitch == 1.3 )
                    {
                        chargingPitch = 1.6;
                    }
                    else if ( chargingPitch == 1.6 )
                    {
                        chargingPitch = 1.9;
                    }
                    else if (chargingPitch == 2.2)
                    {
                        chargingPitch = 2.5;
                    }
                }
                magicDustPoof();
                magicDustPoof();

                var CSND;
                {
                    CSND = audio_play_sound(aCharging2, 0, false);
                    audio_sound_gain(CSND, 0.5, 0);
                    audio_sound_pitch(CSND, chargingPitch);
                }
                attackPlusTimer = 0;
            }
            else if (attDamage > attDamageMax)
            {
                attacking = true;
                alarm[2] = 8;
                var PID;
                PID = instance_create(x, y, oShootParticle);
                PID.image_xscale=facing;
                magicDust();
                var MID;
                MID = instance_create(x+facing*18, y-2, oPlayerHalfChargedShot);
                MID.image_xscale=facing;
                magicDust();
                shotCount+=1;
                audio_play_sound(aShoot1, 0, false);
                attDamage = attDamageMax;
                charging = false;
                chargeTimer = 0;
                chargingPitch = 1;
            }
            else
            {
                attacking = true;
                alarm[2] = 8;
                var SID;
                SID = instance_create(x+facing*16, y, oPlayerShot);
                SID.image_xscale=facing;
                shotCount+=1;
                audio_play_sound(aShoot1, 0, false);
                attDamage = attDamageMax
                attackPlusTimer = 0;
                charging = false;
                chargeTimer = 0;
                chargingPitch = 1;
            }
        }
        
        if (random(100)>80)
        {
            instance_create(random_range(x-32, x+32), random_range(y, y-32), oChargeParticle1);
        }
    }
}

if (kActionRel)
{
    chargingPitch = 1;
    if (isCharged)
    {
        attacking = true;
        alarm[2] = 8;
        var PID;
        PID = instance_create(x, y, oShootParticle);
        PID.image_xscale=facing;
        magicDust();
        var CID;
        CID = instance_create(x+facing*18, y-5, oPlayerChargedShot);
        CID.image_xscale=facing;
        shotCount+=1;
        attDamage = attDamageMax;
        audio_play_sound(aShoot1, 0, false);
        isCharged = false;
        chargingPitch = 1;
    }
    else if (charging == true)
    {
        if (attDamage > attDamageMax )
        {
            attacking = true;
            alarm[2] = 8;
            var P2ID;
            P2ID = instance_create(x, y, oShootParticle);
            P2ID.image_xscale=facing;
            magicDust();
            var M2ID;
            M2ID = instance_create(x+facing*18, y-2, oPlayerHalfChargedShot);
            M2ID.image_xscale=facing;
            magicDust();
            shotCount+=1;
            audio_play_sound(aShoot1, 0, false);
            attDamage = attDamageMax;
            charging = false;
            chargeTimer = 0;
            chargingPitch = 1;
        }
        else
        {
            attacking = true;
            alarm[2] = 8;
            var ID;
            S2ID = instance_create(x+facing*16, y, oPlayerShot);
            S2ID.image_xscale=facing;
            shotCount+=1;
            audio_play_sound(aShoot1, 0, false);
            attDamage = attDamageMax
            attackPlusTimer = 0;
            charging = false;
            chargeTimer = 0;
            chargingPitch = 1;
        }
    }
}

// Action
if (kAction) {
    if (!attacking) {
            if (shotCount <= shotMax)
            {
                attacking = true;
                var ID;
                ID = instance_create(x, y, oShootParticle);
                ID.image_xscale=facing;
                magicDust();
                if (player_STATS_MANA >= 1)
                {
                    var ID;
                    ID = instance_create(x+facing*16, y, oPlayerShot);
                    ID.image_xscale=facing;
                    shotCount+=1;
                    audio_play_sound(aShoot1, 0, false);
                    player_STATS_MANA -=1;
                }
                alarm[2] = 8; //Turn off attacking
                alarm[5] = chargeStartTime; //Turn on charging
            }
        }
    }
