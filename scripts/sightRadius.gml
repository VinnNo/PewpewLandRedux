Left_Sight  = hSight;
Right_Sight = hSight;
Above_Sight = vSight;
Below_Sight = vSight;
if ( collision_rectangle(x-Left_Sight,y-Above_Sight,x+Right_Sight,y+Below_Sight,oPlayer,false,true) && oPlayer.cantBeFound == false)
foundHim = true;
else
foundHim = false;
