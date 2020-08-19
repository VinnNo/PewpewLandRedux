if ( image_xscale == RIGHT )
{
    kRight = true;
    kLeft = false;
}
else if ( image_xscale == LEFT )
{
    kLeft = true;
    kRight = false;
}

if ( vx == 0 )
{
    if (image_xscale == RIGHT)
        image_xscale = LEFT;
    else if (image_xscale == LEFT)
        image_xscale = RIGHT;
    xscale = 0.8;
    yscale = 1.2;
}

