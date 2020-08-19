/*
trail_add_null(trail)
Use this function to have the trail progress without adding another point to the trail.
Use this if you need a break in the trail
*/

var (traillength) = ds_grid_width(argument0);
var i;

for(i=traillength-1; i>0; i-=1)
{
    ds_grid_set(argument0,i,0,ds_grid_get(argument0,i-1,0));
    ds_grid_set(argument0,i,1,ds_grid_get(argument0,i-1,1));
}

ds_grid_set(argument0,0,0,-1000);
ds_grid_set(argument0,0,1,-1000);