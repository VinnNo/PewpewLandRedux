playerGetInput();

if (kMagicHeld)
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
            canWalk = true;
            charging = false;
            chargeTimer = 0;
            chargingPitch = 1;
            /*
            var SND;
            {
                SND = audio_play_sound(aIsCharged2, 0, false);
                audio_sound_gain(SND, 0.65, 0);
                audio_sound_pitch(SND, 0.65);
                //audio_sound_gain(SND, 0, 1000);
            }
            */
            
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
                /*
                var CSND;
                {
                    CSND = audio_play_sound(aCharging2, 0, false);
                    audio_sound_gain(CSND, 0.5, 0);
                    audio_sound_pitch(CSND, chargingPitch);
                }
                */
                attackPlusTimer = 0;
            }
            else if (attDamage > attDamageMax)
            {
                usingMagic = true;
                alarm[2] = 8;
                /*
                var PID;
                PID = instance_create(x, y, oShootParticle);
                PID.image_xscale=facing;
                */
                magicDust();
                var MID;
                MID = instance_create(x+facing*18, y-2, oPlayerHalfChargedShot);
                MID.image_xscale=facing;
                magicDust();
                shotCount+=1;
                //audio_play_sound(aShoot1, 0, false);
                attDamage = attDamageMax;
                charging = false;
                chargeTimer = 0;
                chargingPitch = 1;
                sprite_index = sPlayerMagic;
                image_speed = 0;
            }
            else
            {
                usingMagic = true;
                alarm[2] = 8;
                var SID;
                SID = instance_create(x+facing*16, y, oPlayerShot);
                SID.image_xscale=facing;
                shotCount+=1;
                //audio_play_sound(aShoot1, 0, false);
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

if (kMagicRel)
{
    chargingPitch = 1;
    if (isCharged)
    {
        usingMagic = true;
        alarm[2] = 8;
        /*
        var PID;
        PID = instance_create(x, y, oShootParticle);
        PID.image_xscale=facing;
        */
        magicDust();
        var CID;
        CID = instance_create(x+facing*18, y-5, oPlayerChargedShot);
        CID.image_xscale=facing;
        shotCount+=1;
        attDamage = attDamageMax;
        //audio_play_sound(aShoot1, 0, false);
        isCharged = false;
        chargingPitch = 1;
        sprite_index = sPlayerMagic;
        image_speed = 0;
    }
    else if (charging == true)
    {
        if (attDamage > attDamageMax )
        {
            usingMagic = true;
            alarm[2] = 8;
            /*
            var P2ID;
            P2ID = instance_create(x, y, oShootParticle);
            P2ID.image_xscale=facing;
            */
            magicDust();
            var M2ID;
            M2ID = instance_create(x+facing*18, y-2, oPlayerHalfChargedShot);
            M2ID.image_xscale=facing;
            magicDust();
            shotCount+=1;
            //audio_play_sound(aShoot1, 0, false);
            attDamage = attDamageMax;
            charging = false;
            chargeTimer = 0;
            chargingPitch = 1;
            sprite_index = sPlayerMagic;
            image_speed = 0;
        }
        else
        {
            usingMagic = true;
            alarm[2] = 8;
            var ID;
            S2ID = instance_create(x+facing*16, y, oPlayerShot);
            S2ID.image_xscale=facing;
            shotCount+=1;
            //audio_play_sound(aShoot1, 0, false);
            attDamage = attDamageMax
            attackPlusTimer = 0;
            charging = false;
            chargeTimer = 0;
            chargingPitch = 1;
            sprite_index = sPlayerMagic;
            image_speed = 0;
        }
    }
}

// Action
if (kMagic) 
{
    if (!usingMagic) 
    {
            if (shotCount <= shotMax)
            {
                usingMagic = true;
                alarm[2] = 8;
                /*
                var ID;
                ID = instance_create(x, y, oShootParticle);
                ID.image_xscale=facing;
                */
                magicDust();
                if (player_STATS_MANA >= 1)
                {
                    var ID;
                    ID = instance_create(x+facing*16, y, oPlayerShot);
                    ID.image_xscale=facing;
                    shotCount+=1;
                    //audio_play_sound(aShoot1, 0, false);
                    player_STATS_MANA -=1;
                }
                sprite_index = sPlayerMagic;
                image_speed = 0;
                alarm[2] = 8; //Turn off attacking
                alarm[3] = chargeStartTime; //Turn on charging
            }
    }
}
