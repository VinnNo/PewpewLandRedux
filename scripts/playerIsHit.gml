//While being hit
if isHit == true
{
    hitTimer += 1;
    if hitTimer >= hitTime
    {
        isHit = false;
        hitTimer = 0;
        canMove = true;
        hitSprite = false;
        
        invincibilityTimer = 60;
    }
}
