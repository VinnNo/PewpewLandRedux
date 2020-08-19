if (!canWalk)
{
    kLeft   = false;
    kRight  = false;
}
if (canMove == true )
{
    kLeft        = keyboard_check(vk_left)  || gamepad_axis_value(0, gp_axislh) < -0.4;
    kRight       = keyboard_check(vk_right) || gamepad_axis_value(0, gp_axislh) >  0.4;
    kUp          = keyboard_check(vk_up)    || gamepad_axis_value(0, gp_axislv) < -0.4;
    kDown        = keyboard_check(vk_down)  || gamepad_axis_value(0, gp_axislv) >  0.4;

    kJump        = keyboard_check_pressed(ord('Z'))  || gamepad_button_check_pressed(0, gp_face1);
    kJumpRelease = keyboard_check_released(ord('Z')) || gamepad_button_check_released(0, gp_face1);

    kAction      = keyboard_check_pressed(ord('X'))  || gamepad_button_check_pressed(0, gp_face3);
    kActionHeld  = keyboard_check(ord('X'))  || gamepad_button_check(0, gp_face3);
    kActionRel   = keyboard_check_released(ord('X')) || gamepad_button_check_released(0, gp_face3);
    
    kMagic       = keyboard_check_pressed(ord('C'))  || gamepad_button_check_pressed(0, gp_face2);
    kMagicHeld   = keyboard_check(ord('C'))          || gamepad_button_check(0, gp_face2);
    kMagicRel    = keyboard_check_released(ord('C')) || gamepad_button_check_released(0, gp_face2);
    
    
    kRoll       = keyboard_check_pressed(ord('A'))  || gamepad_button_check_pressed(0, gp_shoulderr);
    //kRoll       = keyboard_check_pressed(ord('D'))  || gamepad_button_check_pressed(0, gp_shoulderrb);
}
else
{
    kLeft        = false;
    kRight       = false;
    kUp          = false;
    kDown        = false;

    kJump        = false;
    kJumpRelease = false;

    kAction      = false;
    kActionHeld  = false;
    kActionRel   = false;
    
    kBlock       = false;
    kRollL       = false;
    kRollR       = false;
}

