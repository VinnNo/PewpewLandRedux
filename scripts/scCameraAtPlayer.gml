if (instance_exists(oPlayer)) 
{
        x = max(oPlayer.x - sprite_width  * 0.5 + 8, min(x, oPlayer.x + (sprite_width  * 0.5 - 8)));
        y = max(oPlayer.y - sprite_height * 0.5 + 8, min(y, oPlayer.y + (sprite_height * 0.5 - 8)));
        //scParallax();
        
        // Approach      
        view_xview[0] = Approach(view_xview[0], x - view_wport[0] * 0.5, 10);
        view_yview[0] = Approach(view_yview[0], y - view_hport[0] * 0.5 - 16, 10);
                
        // Make sure camera is inside room
        view_xview[0] = max(0, min(view_xview[0], room_width  - view_wport[0]));
        view_yview[0] = max(0, min(view_yview[0], room_height - view_hport[0]));      
}
