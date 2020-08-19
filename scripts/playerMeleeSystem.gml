if ( onGround && vx != 0 )
{
    vx = 0;
}
        
image_index  = 0;
image_speed  = 0.5;
sprite_index = sPlayerMelee1;

var attackID;
{
    attackID = (instance_create(x, y, oMeleeAttack_Player))
    if ( !onGround )
    {
        if (kDown)
        {
            attackID.oName = "Melee Down";
            attackPos = 2;
        }
        else if (kUp)
        {
            attackID.oName = "Melee Up";
            attackPos = 1;
        }
        else if ( attackCount == 0 )
        {
            attackID.oName = "Melee One";
            attackPos = 0;
        }
        else
        {
            attackID.oName = "Melee Two";
            attackPos = 0;
        }
    }
    else
    {
        if ( state == RUN )
        {
            attackID.oName = "Melee Run";
            attackPos = 0;
        }
        else if (attackCount = 0)
        {
            attackID.oName = "Melee One";
            attackPos = 0;
        }
        else if (attackCount = 1)
        {
            attackID.oName = "Melee Two";
            attackPos = 0;
        }
    }
}

attackID.creatorID  = id;
attackID.facing     = facing;
attackID.imgSpd     = image_speed;
       
attacking = true;

