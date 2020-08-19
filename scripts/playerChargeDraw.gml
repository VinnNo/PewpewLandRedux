var blueOne, blueTwo, blueThree, blueFour;
blueOne     = make_colour_rgb(0, 255, 255);
blueTwo     = make_colour_rgb(0, 215, 255);
blueThree   = make_colour_rgb(0, 180, 240);
blueFour    = make_colour_rgb(0, 120, 230);


if (charging)
{
    if (chargeColor == white)
    {
        draw_sprite_ext(sPlayerChargingFX, image_index, x, y + (16 - 16 * yscale) * 0.25, facing * xscale, yscale, slantAngle, blueOne, image_alpha);
        chColorTimer += 1;
        if (chColorTimer == chColorTimerMax )
        {
            chColorTimer = 0;
            chargeColor = pink;
        }
    }
    else if (chargeColor == pink)
    {
        draw_sprite_ext(sPlayerChargingFX, image_index, x, y + (16 - 16 * yscale) * 0.25, facing * xscale, yscale, slantAngle, blueTwo, image_alpha);
        chColorTimer += 1;
        if (chColorTimer == chColorTimerMax )
        {
            chColorTimer = 0;
            chargeColor = purple;
        }
    }
    else if (chargeColor == purple)
    {
        draw_sprite_ext(sPlayerChargingFX, image_index, x, y + (16 - 16 * yscale) * 0.25, facing * xscale, yscale, slantAngle, blueThree, image_alpha);
        chColorTimer += 1;
        if (chColorTimer == chColorTimerMax )
        {
            chColorTimer = 0;
            chargeColor = pink2;
        }
    }
    else if (chargeColor == pink2)
    {
        draw_sprite_ext(sPlayerChargingFX, image_index, x, y + (16 - 16 * yscale) * 0.25, facing * xscale, yscale, slantAngle, blueFour, image_alpha);
        chColorTimer += 1;
        if (chColorTimer == chColorTimerMax )
        {
            chColorTimer = 0;
            chargeColor = white;
        }
    }
    draw_sprite(sPlayerChargeFx, image_index, x, y);
}
else if (isCharged)
{
    if (chargeColor == white)
    {
        draw_sprite_ext(sprite_index, image_index, x, y + (16 - 16 * yscale) * 0.25, facing * xscale, yscale, slantAngle, blueOne, image_alpha);
        icColorTimer += 1;
        if ( icColorTimer == icColorTimerMax )
        {
            icColorTimer = 0;
            chargeColor = pink;
        }
    }
    else if (chargeColor == pink)
    {
        draw_sprite_ext(sprite_index, image_index, x, y + (16 - 16 * yscale) * 0.25, facing * xscale, yscale, slantAngle, blueTwo, image_alpha);
        icColorTimer += 1;
        if ( icColorTimer == icColorTimerMax )
        {
            icColorTimer = 0;
            chargeColor = purple;
        }
    }
    else if (chargeColor == purple)
    {
        draw_sprite_ext(sprite_index, image_index, x, y + (16 - 16 * yscale) * 0.25, facing * xscale, yscale, slantAngle, blueThree, image_alpha);
        icColorTimer += 1;
        if ( icColorTimer == icColorTimerMax )
        {
            icColorTimer = 0;
            chargeColor = pink2;
        }
    }
    else if (chargeColor == pink2)
    {
        draw_sprite_ext(sprite_index, image_index, x, y + (16 - 16 * yscale) * 0.25, facing * xscale, yscale, slantAngle, c_white, image_alpha);
        icColorTimer += 1;
        if ( icColorTimer == icColorTimerMax )
        {
            icColorTimer = 0;
            chargeColor = white;
            magicDustPoof();
        }
    }
}
