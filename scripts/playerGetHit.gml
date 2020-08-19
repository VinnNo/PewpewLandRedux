///playerGetHit(health)
//Call it like this: with oPlayer playerGetHit();
//Makes the player get hit

if canHit == true
{
    player_STATS_HP -= baddieID.contactDamage;
    //oUserInterface.image_index-=other.contactDamage;
    
    canHit = false;
    inShock = true;
    isHit = true;
    hitTimer = 0;
    hitSprite = true;
    sprite_index = sTwiggyHit;
    image_speed = 0.10;
    if (charging || isCharged)
    {
        if (charging == true)
        {
            charging = false;
            attDamage = attDamageMax;
            chargingPitch = 1;
        }
        if (isCharged == true)
        {
            isCharged = false;
            attDamage = attDamageMax;
            chargingPitch = 1;
        }
        playerGetInput();
        if (kActionHeld)
        alarm[5] = chargeStartTime;
    }
    
    //Lets not go into the ceiling
    //If we did, we would clip inside the ceiling above us
    if !((place_meeting(x, y-3, oParSolid)))
    {
        canMove = false;
        if (knockBackPlus)
        {
            vx = facing * -2.5;
            vy = -2;
            knockBackPlus = false;
        }
        else
        {
            if ( x > baddieID.x )
            {
                vx = 1.5;
                vy = -1;
            }
            else
            {
                vx = -1.5;
                vy = -1;
            }
            //vx = facing * -1.5;
            //vy = -1;
        }

    }
    
    //if hp > 0
        //audio_play_sound(apHit, 0, false);
}
