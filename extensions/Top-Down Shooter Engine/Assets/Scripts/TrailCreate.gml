/*
trail_create(length,initial_x,initial_y);

Use this function to create a trail. It returns the id of the grid containing the trail information.
Note that a single object may have multiple trails.
*/

var (trail) = ds_grid_create(argument0,2); // create the grid of trail coordinates
var i;

for (i=0; i<argument0; i+=1) // set all initial trail coordinates in the grid to be the current position of the object
{
    ds_grid_add(trail,i,0,argument1);
    ds_grid_add(trail,i,1,argument2);
}

return (trail); // return the name of the grid of trail coordinates