var idleSprite, jumpSprite, runSprite, skidSprite, duckSprite, dashSprite;
if ( gunID != 0 )
{
    idleSprite      = sTwiggyGunIdle;
    jumpSprite      = sTwiggyGunJump;
    runSprite       = sTwiggyGunRun;
    skidSprite      = sTwiggyGunSkid;
    duckSprite      = sTwiggyGunDuck;
    dashSprite      = sTwiggyGunDash;
}
else
{
    idleSprite      = sTwiggyIdle;
    jumpSprite      = sTwiggyJump;
    runSprite       = sTwiggyRun;
    skidSprite      = sTwiggySkid;
    duckSprite      = sTwiggyDuck;
    dashSprite      = sTwiggyDash;
}

switch (state) 
{
    case IDLE:
        if (hitSprite)
        {
            sprite_index = sTwiggyHit;
            image_speed = 0.1;
        }
        else if ( isDucking )
        {
            sprite_index = duckSprite;
            image_speed = 0;
        }
        else
        {
            sprite_index = idleSprite;
            image_speed = 0.2;
        }
    break;
    
    case RUN:
        if (hitSprite)
        {
            sprite_index = sTwiggyHit;
            image_speed = 0.1;
        }
        else if (skid)
        {
            sprite_index = skidSprite;
            image_speed = 0.3;
        }
        else
        {
            if ( place_meeting(x + 1*facing, y, oParSolid) )
            {
                sprite_index = sTwiggyCant
                image_speed = 0;
            }
            else
            {
                //image_speed = 0.15;
                var runSpeed;
                runSpeed = vx;
                if (runSpeed < 0 )
                {
                    runSpeed = -runSpeed;
                }
                runAnim = runSpeed;
                image_speed = runAnim/7.5;
                sprite_index = runSprite;
            }
        }
    break;
    
    case JUMP:
        if (hitSprite)
        {
            sprite_index = sTwiggyHit;
            image_speed = 0.1;
        }
        // Mid jump
        else
        {
            sprite_index = jumpSprite;
        if (!(place_meeting(x, y + 2, oParSolid) && vy != 0) && vy >= -1.0 && vy <= 1.0) 
        {  
            image_speed = 0;
            image_index = 1; 
        } 
        else 
        { 
            // Rise + fall
            if (vy <= 0)
            { 
                image_speed = 0;
                image_index = 0;
            }  
            else
            {
                image_speed = 0;
                image_index = 2;
            }
        }
         
        // When against a wall   
        if (cRight || cLeft)
        {
            sprite_index = sTwiggySlide
            image_speed = 0;
            // Mid jump
            if (!(place_meeting(x, y + 2, oParSolid) && vy != 0) && vy >= -1.0 && vy <= 1.0) 
            {  
                image_index = 1 
            } 
            else 
            { 
                // Rise + fall
                if (vy <= 0)
                { 
                    image_index = 0;
                }  
                else
                {
                    image_index = 2;
                }
            }
        }
        }
        break;
        
    case ROLL:
        sprite_index = sTwiggyBall;
        image_speed = 0.5;
    break;
    
    case DASH:
        sprite_index = dashSprite;
        image_speed = 0;
    break;
}

//playerChargeDraw();
