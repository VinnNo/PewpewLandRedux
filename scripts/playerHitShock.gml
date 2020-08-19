//Invincibility
if invincibilityTimer != 0
{
    invincibilityTimer -= 1;
    if invincibilityTimer <= 0
    {
        invincibilityTimer = 0;
        canHit = true;
        visible = true;
    }
    else
    {
        if invincibilityTimer mod 2 == 1
            visible = false;
        else
            visible = true;
    }
}
