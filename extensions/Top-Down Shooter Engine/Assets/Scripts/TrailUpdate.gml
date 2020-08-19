/*
trail_update(trail,source_x,source_y)

Use this function whenever you want to add the current position to the trail.
sourcex and sourcey refer to where the new point on the trail should be
*/

var (traillength) = ds_grid_width(argument0);
var i;

for(i=traillength-1; i>0; i-=1)
{
    ds_grid_set(argument0,i,0,ds_grid_get(argument0,i-1,0));
    ds_grid_set(argument0,i,1,ds_grid_get(argument0,i-1,1));
}

ds_grid_set(argument0,0,0,argument1);
ds_grid_set(argument0,0,1,argument2);