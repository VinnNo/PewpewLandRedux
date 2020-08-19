//enemyMakeShot(x, y, 360, spd, sBulletShot, sBulletShotParticle, 10);

var createX, createY, createDir, createSpd, createSpr, createPar, parType, bulletID;
createX     = argument0;
createY     = argument1;
createDir   = argument2;
createSpd   = argument3;
createSpr   = argument4;
createPar   = argument5;    //Particle Sprite
parType     = argument6;    //Particle Type (eg it shrinks, fades out, spins etc)

bulletID = instance_create(createX, createY, oEnBullet);
bulletID.sprite_index   = createSpr;
bulletID.image_xscale   = image_xscale;
bulletID.contactDamage  = contactDamage;
bulletID.Dir            = createDir;
bulletID.spd            = createSpd;
bulletID.partSprite     = createPar;
bulletID.particleType   = parType;
