var exception = argument3;

with (argument2) {
    var callingObj = id;
    
    if (id == exception)
        continue;
    else
        with (other)
            if (place_meeting(argument0, argument1, callingObj))
            return true;
}

return false;