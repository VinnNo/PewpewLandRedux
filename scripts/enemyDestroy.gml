///Death Effect

if (frozen == false)
{
    var ID;
    ID = instance_create(xprevious,yprevious,oEnemyDeath);
    ID.oName = oName;
    ID.sprite_index = deathSeq;
    if ( oPlayer.x < x )
    {
        ID.BumpDir = 1;
    }
    else
    {
        ID.BumpDir = -1;
    }
    ID.image_xscale=image_xscale;
}
