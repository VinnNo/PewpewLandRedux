var attackID;

attackID = instance_create(x, y, oEnDamage)
attackID.creatorID = id;
creationID = attackID.id;
if ( argument0 == 0 )
{
    attackID.sprite_index = sprite_index;
}
else if ( argument0 == 1 )
{
    attackID.sprite_index = attMask1;
}
else if ( argument0 == 2 )
{
    attackID.sprite_index = attMask2;
}
else if ( argument0 == 3 )
{
    attackID.sprite_index = attMask3;
}
else if ( argument0 == 4 )
{
    attackID.sprite_index = attMask4;
}
else    
{
    attackID.sprite_index = argument0;
}
attackID.image_xscale = image_xscale;
attackID.image_index = image_index;
attackID.contactDamge = contactDamage;

