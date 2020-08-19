Left_Sight  = closeQuarters;
Right_Sight = closeQuarters;
Above_Sight = closeQuarters;
Below_Sight = closeQuarters;
if (collision_rectangle(x-Left_Sight,y-Above_Sight,x+Right_Sight,y+Below_Sight,oPlayer,false,true) && oPlayer.cantBeFound == false)
isClose = true;
else
isClose = false;
