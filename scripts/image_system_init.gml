#define image_system_init
///image_system_init()
/*
global.m_ex_image = ds_map_create();
global.ex_image_cache_version = "1.0";


#define image_system_cleanup
///image_system_cleanup()
if( ds_exists( global.m_ex_image , ds_type_map ) ){
    while( ds_map_size( global.m_ex_image ) > 0 ){
        var _key = ds_map_find_first( global.m_ex_image );
        image_group_destroy( _key );
    }
    ds_map_destroy( global.m_ex_image );
    draw_texture_flush();
    show_debug_message( "IMAGE SYSTEM: Cleaned all image system memory" );
} else {
    show_debug_message( "IMAGE SYSTEM: Failed to clean image system, it is already clean");
}


#define draw_image
///draw_image(image,subimg,x,y)
gml_pragma("forceinline"); // in YYC, proccessing boost

var _c_subimg = ( floor(argument1) mod argument0[# 1 , 0 ] ) * 3;
draw_background_part(
    argument0[# 6 + _c_subimg , 0 ] , 
    argument0[# 7 + _c_subimg , 0 ] ,
    argument0[# 8 + _c_subimg , 0 ] ,
    argument0[# 2 , 0 ] ,
    argument0[# 3 , 0 ] ,
    argument2 - argument0[# 4 , 0 ] ,
    argument3 - argument0[# 5 , 0 ]
);


#define draw_image_ext
///draw_image_ext(image,subimg,x,y,xscale,yscale,rot,colour,alpha)
gml_pragma("forceinline"); // in YYC, proccessing boost

var _c_subimg = ( floor(argument1) mod argument0[# 1 , 0 ] ) * 3;
draw_background_general(
    argument0[# 6 + _c_subimg , 0 ] , 
    argument0[# 7 + _c_subimg , 0 ] ,
    argument0[# 8 + _c_subimg , 0 ] ,
    argument0[# 2 , 0 ] ,
    argument0[# 3 , 0 ] ,
    argument2 - lengthdir_x( argument0[# 4 , 0 ] , argument6 )*argument4 - lengthdir_x( argument0[# 5 , 0 ] , argument6 - 90 )*argument5 ,
    argument3 - lengthdir_y( argument0[# 4 , 0 ] , argument6 )*argument4 - lengthdir_y( argument0[# 5 , 0 ] , argument6 - 90 )*argument5 ,
    argument4 ,
    argument5 ,
    argument6 ,
    argument7 ,
    argument7 ,
    argument7 ,
    argument7 ,
    argument8
);


#define draw_image_general
///draw_image_general(sprite,subimg,left,top,width,height,x,y,xscale,yscale,rot,c1,c2,c3,c4,alpha)
gml_pragma("forceinline"); // in YYC, proccessing boost

var _c_subimg = ( floor(argument1) mod argument0[# 1 , 0 ] ) * 3;
draw_background_general(
    argument0[# 6 + _c_subimg , 0 ] , 
    argument0[# 7 + _c_subimg , 0 ] + argument2 ,
    argument0[# 8 + _c_subimg , 0 ] + argument3 ,
    argument4 ,
    argument5 ,
    argument6 ,
    argument7 ,
    argument8 ,
    argument9 ,
    argument10 ,
    argument11 ,
    argument12 ,
    argument13 ,
    argument14 ,
    argument15
);


#define draw_image_part
///draw_image_part(sprite,subimg,left,top,width,height,x,y)
gml_pragma("forceinline"); // in YYC, proccessing boost but it inflates the final exe size

var _c_subimg = ( floor(argument1) mod argument0[# 1 , 0 ] ) * 3;
draw_background_part(
    argument0[# 6 + _c_subimg , 0 ] , 
    argument0[# 7 + _c_subimg , 0 ] + argument2 ,
    argument0[# 8 + _c_subimg , 0 ] + argument3 ,
    argument4 ,
    argument5 ,
    argument6 ,
    argument7
);


#define draw_image_part_ext
///draw_image_part_ext(sprite,subimg,left,top,width,height,x,y,xscale,yscale,colour,alpha)
gml_pragma("forceinline"); // in YYC, proccessing boost

var _c_subimg = ( floor(argument1) mod argument0[# 1 , 0 ] ) * 3;
draw_background_part_ext(
    argument0[# 6 + _c_subimg , 0 ] , 
    argument0[# 7 + _c_subimg , 0 ] + argument2 ,
    argument0[# 8 + _c_subimg , 0 ] + argument3 ,
    argument4 ,
    argument5 ,
    argument6 ,
    argument7 ,
    argument8 ,
    argument9 ,
    argument10 ,
    argument11
);


#define draw_image_pos
///draw_image_pos(sprite,subimg,x1,y1,x2,y2,x3,y3,x4,y4,alpha)
gml_pragma("forceinline"); // in YYC, proccessing boost

var _c_subimg = ( floor(argument1) mod argument0[# 1 , 0 ] ) * 3;
var _bck = argument0[# 6 + _c_subimg , 0 ];

var _u_x = argument0[# 7 + _c_subimg , 0 ] / background_get_width( _bck );
var _u_y = argument0[# 8 + _c_subimg , 0 ] / background_get_height( _bck );
var _u_w = argument0[# 2 , 0 ] / background_get_width( _bck );
var _u_h = argument0[# 3 , 0 ] / background_get_height( _bck );

draw_set_alpha( argument10 );
draw_primitive_begin_texture( pr_trianglelist , background_get_texture( _bck ) );
    draw_vertex_texture( argument2 , argument3 , _u_x , _u_y );
    draw_vertex_texture( argument4 , argument5 , _u_x+_u_w , _u_y );
    draw_vertex_texture( argument6 , argument7 , _u_x+_u_w , _u_y+_u_h );
    
    draw_vertex_texture( argument8 , argument9 , _u_x , _u_y+_u_h );
    draw_vertex_texture( argument2 , argument3 , _u_x , _u_y );
    draw_vertex_texture( argument6 , argument7 , _u_x+_u_w , _u_y+_u_h );
draw_primitive_end();


#define draw_image_pos_ext
///draw_image_pos_ext(sprite,subimg,x1,y1,x2,y2,x3,y3,x4,y4,rot,col,alpha)
gml_pragma("forceinline"); // in YYC, proccessing boost

var _c_subimg = ( floor(argument1) mod argument0[# 1 , 0 ] ) * 3;
var _bck = argument0[# 6 + _c_subimg , 0 ];

var _u_x = argument0[# 7 + _c_subimg , 0 ] / background_get_width( _bck );
var _u_y = argument0[# 8 + _c_subimg , 0 ] / background_get_height( _bck );
var _u_w = argument0[# 2 , 0 ] / background_get_width( _bck );
var _u_h = argument0[# 3 , 0 ] / background_get_height( _bck );

var _x1 = argument2;
var _y1 = argument3;
var _dis1 = point_distance(  _x1 , _y1 , argument4 , argument5 );
var _dir1 = point_direction( _x1 , _y1 , argument4 , argument5 ) + argument10;
var _dis2 = point_distance(  _x1 , _y1 , argument6 , argument7 );
var _dir2 = point_direction( _x1 , _y1 , argument6 , argument7 ) + argument10;
var _dis3 = point_distance(  _x1 , _y1 , argument8 , argument9 );
var _dir3 = point_direction( _x1 , _y1 , argument8 , argument9 ) + argument10;

draw_primitive_begin_texture( pr_trianglelist , background_get_texture( _bck ) );
    draw_vertex_texture_colour( _x1 , _y1 , _u_x , _u_y , argument11 , argument12 );
    draw_vertex_texture_colour( _x1 + lengthdir_x( _dis1 , _dir1 ) , _y1 + lengthdir_y( _dis1 , _dir1 ) , _u_x+_u_w , _u_y , argument11 , argument12 );
    draw_vertex_texture_colour( _x1 + lengthdir_x( _dis2 , _dir2 ) , _y1 + lengthdir_y( _dis2 , _dir2 ) , _u_x+_u_w , _u_y+_u_h , argument11 , argument12 );
    
    draw_vertex_texture_colour( _x1 + lengthdir_x( _dis3 , _dir3 ) , _y1 + lengthdir_y( _dis3 , _dir3 ) , _u_x , _u_y+_u_h , argument11 , argument12 );
    draw_vertex_texture_colour( _x1 , _y1 , _u_x , _u_y , argument11 , argument12 );
    draw_vertex_texture_colour( _x1 + lengthdir_x( _dis2 , _dir2 ) , _y1 + lengthdir_y( _dis2 , _dir2 ) , _u_x+_u_w , _u_y+_u_h , argument11 , argument12 );
draw_primitive_end();



#define draw_image_pos_general
///draw_image_pos_general(sprite,subimg,x1,y1,x2,y2,x3,y3,x4,y4,rot,c1,c2,c3,c4,alpha)
gml_pragma("forceinline"); // in YYC, proccessing boost


var _c_subimg = ( floor(argument1) mod argument0[# 1 , 0 ] ) * 3;
var _bck = argument0[# 6 + _c_subimg , 0 ];

var _u_x = argument0[# 7 + _c_subimg , 0 ] / background_get_width( _bck );
var _u_y = argument0[# 8 + _c_subimg , 0 ] / background_get_height( _bck );
var _u_w = argument0[# 2 , 0 ] / background_get_width( _bck );
var _u_h = argument0[# 3 , 0 ] / background_get_height( _bck );

var _x1 = argument2;
var _y1 = argument3;
var _dis1 = point_distance(  _x1 , _y1 , argument4 , argument5 );
var _dir1 = point_direction( _x1 , _y1 , argument4 , argument5 ) + argument10;
var _dis2 = point_distance(  _x1 , _y1 , argument6 , argument7 );
var _dir2 = point_direction( _x1 , _y1 , argument6 , argument7 ) + argument10;
var _dis3 = point_distance(  _x1 , _y1 , argument8 , argument9 );
var _dir3 = point_direction( _x1 , _y1 , argument8 , argument9 ) + argument10;

draw_primitive_begin_texture( pr_trianglelist , background_get_texture( _bck ) );
    draw_vertex_texture_colour( _x1 , _y1 , _u_x , _u_y , argument11 , argument15 );
    draw_vertex_texture_colour( _x1 + lengthdir_x( _dis1 , _dir1 ) , _y1 + lengthdir_y( _dis1 , _dir1 ) , _u_x+_u_w , _u_y , argument12 , argument15 );
    draw_vertex_texture_colour( _x1 + lengthdir_x( _dis2 , _dir2 ) , _y1 + lengthdir_y( _dis2 , _dir2 ) , _u_x+_u_w , _u_y+_u_h , argument13 , argument15 );
    
    draw_vertex_texture_colour( _x1 + lengthdir_x( _dis3 , _dir3 ) , _y1 + lengthdir_y( _dis3 , _dir3 ) , _u_x , _u_y+_u_h , argument14 , argument15 );
    draw_vertex_texture_colour( _x1 , _y1 , _u_x , _u_y , argument11 , argument15 );
    draw_vertex_texture_colour( _x1 + lengthdir_x( _dis2 , _dir2 ) , _y1 + lengthdir_y( _dis2 , _dir2 ) , _u_x+_u_w , _u_y+_u_h , argument13 , argument15 );
draw_primitive_end();



#define draw_image_stretched
///draw_image_stretched(sprite,subimg,x,y,w,h)
gml_pragma("forceinline"); // in YYC, proccessing boost

var _c_subimg = ( floor(argument1) mod argument0[# 1 , 0 ] ) * 3;
draw_background_part_ext(
    argument0[# 6 + _c_subimg , 0 ] , 
    argument0[# 7 + _c_subimg , 0 ] ,
    argument0[# 8 + _c_subimg , 0 ] ,
    argument0[# 2 , 0 ] ,
    argument0[# 3 , 0 ] ,
    argument2 ,
    argument3 ,
    ( argument4 / argument0[# 2 , 0 ] ) ,
    ( argument5 / argument0[# 3 , 0 ] ) ,
    c_white ,
    1
);


#define draw_image_stretched_ext
///draw_image_stretched_ext(sprite,subimg,x,y,w,h,colour,alpha)
gml_pragma("forceinline"); // in YYC, proccessing boost

var _c_subimg = ( floor(argument1) mod argument0[# 1 , 0 ] ) * 3;
draw_background_part_ext(
    argument0[# 6 + _c_subimg , 0 ] , 
    argument0[# 7 + _c_subimg , 0 ] ,
    argument0[# 8 + _c_subimg , 0 ] ,
    argument0[# 2 , 0 ] ,
    argument0[# 3 , 0 ] ,
    argument2 ,
    argument3 ,
    ( argument4 / argument0[# 2 , 0 ] ) ,
    ( argument5 / argument0[# 3 , 0 ] ) ,
    argument6 ,
    argument7
);


#define draw_image_tiled
///draw_image_tiled(image,subimg,x,y)
gml_pragma("forceinline"); // in YYC, proccessing boost

var _c_subimg = ( floor(argument1) mod argument0[# 1 , 0 ] ) * 3;

var _w = argument0[# 2 , 0 ];
var _h = argument0[# 3 , 0 ];
var _bck  = argument0[# 6 + _c_subimg , 0 ];
var _left = argument0[# 7 + _c_subimg , 0 ];
var _top  = argument0[# 8 + _c_subimg , 0 ];
var _xo = ( argument2 mod _w );
var _yo = ( argument3 mod _h );

for( var _x = -_w; _x <= view_wview[ view_current ]; _x += _w ){
    for( var _y = -_h; _y <= view_hview[ view_current ]; _y += _h ){
        draw_background_part(
            _bck , 
            _left ,
            _top ,
            _w ,
            _h ,
            _xo + _x ,
            _yo + _y
        );
    }
}


#define draw_image_tiled_area
///draw_image_tiled_area(image,subimg,x1,y1,x2,y2)
gml_pragma("forceinline"); // in YYC, proccessing boost

var _c_subimg = ( floor(argument1) mod argument0[# 1 , 0 ] ) * 3;

var _w = argument0[# 2 , 0 ];
var _h = argument0[# 3 , 0 ];
var _bck  = argument0[# 6 + _c_subimg , 0 ];
var _left = argument0[# 7 + _c_subimg , 0 ];
var _top  = argument0[# 8 + _c_subimg , 0 ];

var _x1 = argument2;
var _x2 = argument4;
var _y1 = argument3;
var _y2 = argument5;
var _xadd = 1 - 2 * ( argument4 < argument2 );
var _yadd = 1 - 2 * ( argument5 < argument3 );

var _x = _x1 - _w * ( _xadd == -1 );
var _y = _y1 - _h * ( _yadd == -1 );
repeat( floor( abs( _x2 - _x1 ) / _w ) ){
    repeat( floor( abs( _y2 - _y1 ) / _h ) ){
        draw_background_part(
            _bck , 
            _left ,
            _top ,
            _w ,
            _h ,
            _x ,
            _y 
        );
        _y += _h * _yadd;
    }
    _x += _w * _xadd;
    _y = _y1 - _h * ( _yadd == -1 );
}
var _y_side = _y;

// HORISONTAL
var _x = _x1 - _w * ( _xadd == -1 );
_y = _y1 + floor( ( _y2 - _y1 ) / _h ) * _h;

if( _yadd == -1 ){
    var _part_top = _top + abs( _y2 - _y );
    var _part_h = abs( ( _y2 - _h ) - _y );
    var _part_y = _y + abs( _y2 - _y );
} else {
    var _part_top = _top;
    var _part_h = abs( _y2 - _y );
    var _part_y = _y;
}
repeat( floor( abs( _x2 - _x1 ) / _w ) ){
    draw_background_part_ext(
        _bck , 
        _left ,
        _part_top ,
        _w ,
        _part_h ,
        _x ,
        _part_y ,
        1 , 
        1 ,
        c_white ,
        1
    );
    _x += _w * _xadd;
}

// VERTICAL
var _y = _y1 - _h * ( _yadd == -1 );
_x = _x1 + floor( ( _x2 - _x1 ) / _w ) * _w;

if( _xadd == -1 ){
    var _part_left = _left + abs( _x2 - _x );
    var _part_w = abs( ( _x2 - _w ) - _x );
    var _part_x = _x + abs( _x2 - _x );
} else {
    var _part_left = _left;
    var _part_w = abs( _x2 - _x );
    var _part_x = _x;
}
repeat( floor( abs( _y2 - _y1 ) / _h ) ){
    draw_background_part_ext(
        _bck , 
        _part_left ,
        _top ,
        _part_w ,
        _h ,
        _part_x ,
        _y ,
        1 , 
        1 ,
        c_white ,
        1
    );
    _y += _h * _yadd;
}

// EDGE TILE
draw_background_part_ext(
    _bck , 
    _part_left ,
    _part_top ,
    _part_w ,
    _part_h ,
    _part_x ,
    _part_y ,
    1 , 
    1 ,
    c_white ,
    1
);



#define draw_image_tiled_area_ext
///draw_image_tiled_area_ext(image,subimg,x1,y1,x2,y2,xscale,yscale,colour,alpha)
gml_pragma("forceinline"); // in YYC, proccessing boost

var _c_subimg = ( floor(argument1) mod argument0[# 1 , 0 ] ) * 3;

var _w = argument0[# 2 , 0 ];
var _h = argument0[# 3 , 0 ];

var _tw = argument0[# 2 , 0 ] * argument6;
var _th = argument0[# 3 , 0 ] * argument7;

var _bck  = argument0[# 6 + _c_subimg , 0 ];
var _left = argument0[# 7 + _c_subimg , 0 ];
var _top  = argument0[# 8 + _c_subimg , 0 ];

var _x1 = argument2;
var _x2 = argument4;
var _y1 = argument3;
var _y2 = argument5;
var _xadd = 1 - 2 * ( argument4 < argument2 );
var _yadd = 1 - 2 * ( argument5 < argument3 );

var _x = _x1 - _tw * ( _xadd == -1 );
var _y = _y1 - _th * ( _yadd == -1 );
repeat( floor( abs( _x2 - _x1 ) / _tw ) ){
    repeat( floor( abs( _y2 - _y1 ) / _th ) ){
        draw_background_part_ext(
            _bck , 
            _left ,
            _top ,
            _w ,
            _h ,
            _x ,
            _y ,
            argument6 ,
            argument7 ,
            argument8 ,
            argument9
        );
        _y += _th * _yadd;
    }
    _x += _tw * _xadd;
    _y = _y1 - _th * ( _yadd == -1 );
}
var _y_side = _y;

// HORISONTAL
var _x = _x1 - _tw * ( _xadd == -1 );
_y = _y1 + floor( ( _y2 - _y1 ) / _th ) * _th;

if( _yadd == -1 ){
    var _part_top = _top + abs( _y2 - _y ) / argument7;
    var _part_h = abs( ( _y2 - _th ) - _y ) / argument7;
    var _part_y = _y + abs( _y2 - _y );
} else {
    var _part_top = _top;
    var _part_h = abs( _y2 - _y ) / argument7;
    var _part_y = _y;
}
repeat( floor( abs( _x2 - _x1 ) / _tw ) ){
    draw_background_part_ext(
        _bck , 
        _left ,
        _part_top ,
        _w ,
        _part_h ,
        _x ,
        _part_y ,
        argument6 , 
        argument7 ,
        argument8 ,
        argument9
    );
    _x += _tw * _xadd;
}

// VERTICAL
var _y = _y1 - _th * ( _yadd == -1 );
_x = _x1 + floor( ( _x2 - _x1 ) / _tw ) * _tw;

if( _xadd == -1 ){
    var _part_left = _left + abs( _x2 - _x ) / argument6;
    var _part_w = abs( ( _x2 - _tw ) - _x ) / argument6;
    var _part_x = _x + abs( _x2 - _x );
} else {
    var _part_left = _left;
    var _part_w = abs( _x2 - _x ) / argument6;
    var _part_x = _x;
}
repeat( floor( abs( _y2 - _y1 ) / _th ) ){
    draw_background_part_ext(
        _bck , 
        _part_left ,
        _top ,
        _part_w ,
        _h ,
        _part_x ,
        _y ,
        argument6 , 
        argument7 ,
        argument8 ,
        argument9
    );
    _y += _th * _yadd;
}

// EDGE TILE
draw_background_part_ext(
    _bck , 
    _part_left ,
    _part_top ,
    _part_w ,
    _part_h ,
    _part_x ,
    _part_y ,
    argument6 , 
    argument7 ,
    argument8 ,
    argument9
);



#define draw_image_tiled_ext
///draw_image_tiled_ext(sprite,subimg,x,y,xscale,yscale,colour,alpha)
gml_pragma("forceinline"); // in YYC, proccessing boost

var _c_subimg = ( floor(argument1) mod argument0[# 1 , 0 ] ) * 3;

var _w = argument0[# 2 , 0 ];
var _h = argument0[# 3 , 0 ];
var _bck  = argument0[# 6 + _c_subimg , 0 ];
var _left = argument0[# 7 + _c_subimg , 0 ];
var _top  = argument0[# 8 + _c_subimg , 0 ];
var _xo = ( argument2 mod (_w*argument4) );
var _yo = ( argument3 mod (_h*argument5) );

for( var _x = -_w * argument4; _x <= view_wview[ view_current ]; _x += _w * argument4 ){
    for( var _y = -_h * argument5; _y <= view_hview[ view_current ]; _y += _h * argument5 ){
        draw_background_part_ext(
            _bck , 
            _left ,
            _top ,
            _w ,
            _h ,
            _xo + _x ,
            _yo + _y ,
            argument4 ,
            argument5 ,
            argument6 ,
            argument7
        );
    }
}


#define image_group_create
///image_group_create(name)
/*
    Creates a new image group
    
    -------------------------
        name - The group name that you will be using to reference to the group later.
    -------------------------
    
    RETURNS eiher the name of the new group or -1 which means that the function failed because the grup already exists.
*/
if( !ds_map_exists( global.m_ex_image , argument0 ) ){
    var _l = ds_list_create();
    ds_map_add_list( global.m_ex_image , argument0 , _l );
    _l[| 0 ] = ds_list_create(); // 'Image' list
    _l[| 1 ] = ds_list_create(); // Background list
    ds_list_mark_as_list( _l , 0 );
    ds_list_mark_as_list( _l , 1 );
    return argument0;
} else {
    return -1;
}


#define image_group_destroy
///image_group_destroy(group)
if( ds_map_exists( global.m_ex_image , argument0 ) ){
    var _l = global.m_ex_image[? argument0 ];
    var _l_image = _l[| 0 ];
    var _l_background = _l[| 1 ];
    
    // If the stream is active, clear it
    if( ds_list_size( _l ) == 3 ){
        var _m_stream = _l[| 2 ];
        ds_list_destroy( _m_stream[? "loading" ] );
        ds_list_destroy( _m_stream[? "loading_3d" ] );
        var _p_sprite = _m_stream[? "sprite" ];
        while( ds_priority_size( _p_sprite ) > 0 ){
            var _l = ds_priority_delete_max( _p_sprite );
            sprite_delete( _l[| 0 ] );
            ds_list_destroy( _l );
        }
        ds_priority_destroy( _p_sprite );
        
        var _p_sprite_3d = _m_stream[? "sprite_3d" ];
        while( ds_priority_size( _p_sprite ) > 0 ){
            var _l = ds_priority_delete_max( _p_sprite_3d );
            sprite_delete( _l[| 0 ] );
            ds_list_destroy( _l );
        }
        ds_priority_destroy( _p_sprite_3d );
        
        ds_map_destroy( _m_stream );
    }
    
    // Clear the image info
    for( var n = 0; n < ds_list_size( _l_image ); n++ ){
        ds_grid_destroy( _l_image[| n ] );
    }
    
    // Clear the images
    for( var n = 0; n < ds_list_size( _l_background ); n++ ){
        background_delete( _l_background[| n ] );
    }
    // Remove the data structures
    ds_list_destroy( _l_image );
    ds_list_destroy( _l_background );
    ds_list_destroy( _l );
    ds_map_delete( global.m_ex_image , argument0 );
    return true;
} else {
    show_error( "The group '" + string( argument0 ) + "' you are trying to clear does not exist" , false );
    return false;
}


#define image_group_clear
///image_group_clear(group)
/*
    Clears the image group, does not destroy it.
    
    -------------------------
        group - The group name.
    -------------------------
    
    RETURNS a boolean, this shows whether the groups was cleared or not.
*/
if( ds_map_exists( global.m_ex_image , argument0 ) ){
    var _l = global.m_ex_image[? argument0 ];
    var _l_image = _l[| 0 ];
    var _l_background = _l[| 1 ];
    
    for( var n = 0; n < ds_list_size( _l_image ); n++ ){
        ds_grid_destroy( _l_image[| n ] );
    }
    
    for( var n = 0; n < ds_list_size( _l_background ); n++ ){
        background_delete( _l_background[| n ] );
    }
    ds_list_clear( _l_image );
    ds_list_clear( _l_background );
    return true;
} else {
    show_error( "The group '" + string( argument0 ) + "' you are trying to clear does not exist" , false );
    return false;
}


#define image_group_find_image
///image_group_find_image(group,identifier)
/*
    Returns the image with the identifier.
    
    -------------------------
        group - The group name or the name that image_group_create() returned.
        identifier - The sprite identifier that was applied to the sprite using image_load_add(identifier,...)
    -------------------------
    
    RETURNS the image or -1 if failed.
*/

argument1 = string( argument1 );
if( ds_map_exists( global.m_ex_image , argument0 ) ){
    var _l = global.m_ex_image[? argument0 ];
    var _l_image = _l[| 0 ];
    for( var n = 0; n < ds_list_size( _l_image ); n++ ){
        var _g = _l_image[| n ];
        if( _g[# 0 , 0 ] == argument1 ){
            return _g;
        }
    }
    return( -1 );
} else {
    show_error( "The group '" + string( argument0 ) + "' you are trying to find the image '" + string( argument1 ) + "' from does not exist" , false );
    return( -1 );
}


#define image_group_exists
///image_group_exists(group)
return ds_map_exists( global.m_ex_image , argument0 );


#define image_load_start
///image_load_start(group,tex_page_width,tex_page_height,tex_offset)
if( !ds_map_exists( global.m_ex_image , argument0 ) ){
    show_error( "Unknown image group '" + string( argument0 ) + "'" , true );
}
__s_group      = global.m_ex_image[? argument0 ];
__s_tex_width  = argument1; // TEXTURE PAGE WIDTH
__s_tex_height = argument2; // TEXTURE PAGE HEIGHT
__s_tex_offset = argument3; // SPRITE OFFSET ON THE TEXTURE PAGE

// LIST THAT WILL STORE THE UNSORTED LOADING SPRITE DATA
__s_l_background    = ds_list_create();
// LIST THAT WILL STORE THE SORTED LOADING SPRITE DATA
__s_l_back_sorted   = ds_list_create();
// LIST THAT WILL STORE THE 3D LOADING SPRITE DATA
__s_l_background_3d = ds_list_create();


#define image_load_add
///image_load_add(identifier,fname,subimg,xorig,yorig)
if( file_exists( argument1 ) ){
    ds_list_add( __s_l_background , background_add( argument1 , false , false ) , string( argument0 ) , max(argument2,1) , argument3 , argument4 , argument1 );
} else {
    show_error( "Could not load image from location '" + string( argument1 ) + "'" , true );
}


#define image_load_add_3d
///image_load_add_3d(identifier,fname,subimg,xorig,yorig)
if( file_exists( argument1 ) ){
    ds_list_add( __s_l_background_3d , background_add( argument1 , false , false ) , string( argument0 ) , max(argument2,1) , argument3 , argument4 , argument1 );
} else {
    show_error( "Could not load image from location '" + string( argument1 ) + "'" , true );
}


#define image_load_get
///image_load_get(identifier)
var _val = temp_sprite_get[? string( argument0 ) ];
if( is_undefined( _val ) ){
    show_error( "A sprite with the identifier '" + string( argument0 ) + "' was not found" , false );
}
ds_map_delete( temp_sprite_get , string( argument0 ) );
// DELETE THE TEMP MAP AFTER IT HAS BEEN EMPTIED
if( ds_map_size( temp_sprite_get ) == 0 ){
    ds_map_destroy( temp_sprite_get );
}
return( _val );


#define image_load_finish
///image_load_finish()

var _l_image      = __s_group[| 0 ];
var _l_background = __s_group[| 1 ];

draw_enable_alphablend( false );

// SORT THEIR IMAGES BY THEIR SIZE
for( var n = 0; n < ds_list_size( __s_l_background ); n += 6 ){
    var _size = ( ( background_get_width( __s_l_background[| n ] ) div __s_l_background[| n + 2 ] ) + background_get_height( __s_l_background[| n ] ) ) / 2;
    if( ds_list_size( __s_l_back_sorted ) > 0 ){
        for( var i = 0; i < ds_list_size( __s_l_back_sorted ); i += 7 ){
            if( _size > __s_l_back_sorted[| i ] ){
ds_list_insert( __s_l_back_sorted , i , __s_l_background[| n + 5 ] ); // FNAME
                ds_list_insert( __s_l_back_sorted , i , __s_l_background[| n + 4 ] ); // YORIG
                ds_list_insert( __s_l_back_sorted , i , __s_l_background[| n + 3 ] ); // XORIG
                ds_list_insert( __s_l_back_sorted , i , __s_l_background[| n + 2 ] ); // SUBIMG
                ds_list_insert( __s_l_back_sorted , i , __s_l_background[| n + 1 ] ); // IDENTIFIER
                ds_list_insert( __s_l_back_sorted , i , __s_l_background[| n ] );     // ID
                ds_list_insert( __s_l_back_sorted , i , _size );
                break;
            } else if( i == ds_list_size( __s_l_back_sorted ) - 7 ){
                ds_list_add( __s_l_back_sorted , 
                    _size ,                      // SIZE
                    __s_l_background[| n ] ,     // ID
                    __s_l_background[| n + 1 ] , // IDENTIFIER
                    __s_l_background[| n + 2 ] , // SUBIMG
                    __s_l_background[| n + 3 ] , // XORIG
                    __s_l_background[| n + 4 ] , // YORIG
__s_l_background[| n + 5 ]   // FNAME
                );
                break;
            }
        }
    } else {
        ds_list_add( __s_l_back_sorted , 
            _size ,                      // SIZE
            __s_l_background[| n ] ,     // ID
            __s_l_background[| n + 1 ] , // IDENTIFIER
            __s_l_background[| n + 2 ] , // SUBIMG
            __s_l_background[| n + 3 ] , // XORIG
            __s_l_background[| n + 4 ] , // YORIG
__s_l_background[| n + 5 ]   // FNAME
        );
    }
}



// CREATE THE DATA STRUCTURES NECESSARY FOR ADDING THE SPRITES ON THE TEXTURE PAGE
temp_sprite_get = ds_map_create();

var _l_areas = ds_list_create();
var _l_trash = ds_list_create();
ds_list_add( _l_areas , 0 , 0 , __s_tex_width , __s_tex_height );

var _l_texpage = ds_list_create();
var _back = background_create_colour( __s_tex_width , __s_tex_height , c_black );
ds_list_add( _l_texpage , 
    surface_create( __s_tex_width , __s_tex_height ) , 
    _back
);

surface_set_target( _l_texpage[| ds_list_size( _l_texpage ) - 2 ] );
draw_clear_alpha( 0,0 ); // this can be removed
var _bck = -1;

while( ds_list_size( __s_l_back_sorted ) > 0 ){ // LOOP THROUGH THE SPRITES AND ADD THEM TO THE TEXTURE PAGE WHERE POSSIBLE
    _bck = __s_l_back_sorted[| 1 ];
    
    var spr_number = __s_l_back_sorted[| 3 ];
    var subimg_w = background_get_width( _bck ) div spr_number;
    var _image_drawn = false;
    var _image_maindata_added = false;
    for( var i = 0; i < __s_l_back_sorted[| 3 ]; i++ ){
        var _min_area_size = $10000000000000;
        var _min_area_id   = -1;
        for( var n = 0; n < ds_list_size( _l_areas ); n += 4 ){
            if( subimg_w <= _l_areas[| n + 2 ] and background_get_height( _bck ) <= _l_areas[| n + 3 ] ){
                if( ( ( _l_areas[| n + 2 ] + _l_areas[| n + 3 ] ) / 2 ) < _min_area_size ){
                    _min_area_size = ( _l_areas[| n + 2 ] + _l_areas[| n + 3 ] ) / 2;
                    _min_area_id = n;
                }
            }
        }
        
        // DRAW THE IMAGES ON THE TEXTURE PAGE
        if( _min_area_id != -1 ){
            n = _min_area_id;
            draw_background_part( _bck , i * subimg_w  , 0 , subimg_w , background_get_height( _bck ) , _l_areas[| n ] , _l_areas[| n + 1 ] );
            _image_drawn = true;
            
            if( !_image_maindata_added ){
                // CREATE THE GRID FOR THE IMAGE DATA
                var _g_image = ds_grid_create( 7 + __s_l_back_sorted[| 3 ] * 3 , 1 );
                ds_list_add( _l_image , _g_image );
                var _pos = 0;
                // ADD THE IDENTIFIER TO THE MAP, THE USER WILL GRAB THE SPRITE ID FROM THIS MAP
                ds_map_add( temp_sprite_get , __s_l_back_sorted[| 2 ] , _g_image );
                // ADD THE MAIN DATA OF THE SPRITE TO THE SPRITE DATA STRUCTURE
                _g_image[# _pos , 0 ] = __s_l_back_sorted[| 2 ]; _pos++;       // IDENTIFIER
                _g_image[# _pos , 0 ] = __s_l_back_sorted[| 3 ]; _pos++;       // SUBIMAGE
                _g_image[# _pos , 0 ] = subimg_w; _pos++;                      // SUBIMAGE WIDTH
                _g_image[# _pos , 0 ] = background_get_height( _bck ); _pos++; // SUBIMAGE HEIGHT
                _g_image[# _pos , 0 ] = __s_l_back_sorted[| 4 ]; _pos++;       // XORIGIN
                _g_image[# _pos , 0 ] = __s_l_back_sorted[| 5 ]; _pos++;       // YORIGIN
                _image_maindata_added = true;
            }
            
            // ADD THE SUBIMAGE OF THE SPRITE TO THE SPRITE DATA STRUCTURE
            _g_image[# _pos , 0 ] = _back; _pos++;              // BACKGROUND
            _g_image[# _pos , 0 ] = _l_areas[| n ]; _pos++;     // X
            _g_image[# _pos , 0 ] = _l_areas[| n + 1 ]; _pos++; // Y
            
            if( i == __s_l_back_sorted[| 3 ] - 1 ){
                _g_image[# _pos , 0 ] = __s_l_back_sorted[| 6 ]; // FNAME
            }

            // ADD THE NEW EMPTY AREAS TO THE AREA LIST
            if( background_get_height( _bck ) < _l_areas[| n + 3 ] ){              // Y                                          W                           H
                ds_list_add( _l_areas , _l_areas[| n ] , _l_areas[| n + 1 ] + background_get_height( _bck ) + __s_tex_offset , _l_areas[| n + 2 ] , _l_areas[| n + 3 ] - background_get_height( _bck ) - __s_tex_offset );
            }
            if( subimg_w < _l_areas[| n + 2 ] ){ // X                                 Y                                          W                           H
                ds_list_add( _l_areas , _l_areas[| n ] + subimg_w + __s_tex_offset , _l_areas[| n + 1 ] , _l_areas[| n + 2 ] - subimg_w - __s_tex_offset , background_get_height( _bck ) );
            }
            
            // REMOVE THE CURRENT AREA FROM THE AREA LIST
            repeat( 4 )
                ds_list_delete( _l_areas , n );
        } else {
            show_debug_message( "Warning: Not enough room on the texturepage, creating another one, this might slow down the game" );
            
            ds_list_clear( _l_areas );
            ds_list_add( _l_areas , 0 , 0 , __s_tex_width , __s_tex_height );
            
            _back = background_create_colour( __s_tex_width , __s_tex_height , c_black );
            ds_list_add( _l_texpage , surface_create( __s_tex_width , __s_tex_height ) , _back);
            surface_reset_target();
            surface_set_target( _l_texpage[| ds_list_size( _l_texpage ) - 2 ] );
            draw_clear_alpha( 0,0 );
            
            i--;
        }
    }
    
    if( ds_list_size( _l_areas ) == 0 ){
        show_debug_message( "Warning: Something went wrong, creating another texturepage" );
        
        ds_list_clear( _l_areas );
        ds_list_add( _l_areas , 0 , 0 , __s_tex_width , __s_tex_height );
        
        _back = background_create_colour( __s_tex_width , __s_tex_height , c_black );
        ds_list_add( _l_texpage , surface_create( __s_tex_width , __s_tex_height ) , _back );
        surface_reset_target();
        surface_set_target( _l_texpage[| ds_list_size( _l_texpage ) - 2 ] );
    }
    if( _image_drawn ){
        repeat( 7 ){
            ds_list_delete( __s_l_back_sorted , 0 );
        }
        ds_list_add( _l_trash , _bck );
    }
}
surface_reset_target();

// Clear memory
for( var n = 0; n < ds_list_size( _l_trash ); n++ ){
    background_delete( _l_trash[| n ] );
}
// CREATE THE BACKGROUND (TEXTUREPAGE)
for( var n = 0; n < ds_list_size( _l_texpage ); n += 2 ){
    var _back_temp = background_create_from_surface( _l_texpage[| n ] , 0 , 0 , surface_get_width( _l_texpage[| n ] ) , surface_get_height( _l_texpage[| n ] ) , false , false );
    background_assign( _l_texpage[| n + 1 ] , _back_temp );
    ds_list_add( _l_background , _l_texpage[| n + 1 ] );
    background_delete( _back_temp );
    surface_free( _l_texpage[| n ] );
}


// 3D specific images.
while( ds_list_size( __s_l_background_3d ) > 0 ){
    var _back       = __s_l_background_3d[| 0 ];
    var _identifier = __s_l_background_3d[| 1 ];
    var _subimg     = __s_l_background_3d[| 2 ];
    var _xorig      = __s_l_background_3d[| 3 ];
    var _yorig      = __s_l_background_3d[| 4 ];
    var _w          = floor( background_get_width( _back ) / _subimg );
    var _surface    = surface_create( _w , background_get_height( _back ) );
    
    var _g_image = ds_grid_create( 7 + _subimg * 3 , 1 );
    ds_list_add( _l_image , _g_image );
    var _pos = 0;
    _g_image[# _pos , 0 ] = _identifier; _pos++;                    // IDENTIFIER
    _g_image[# _pos , 0 ] = _subimg; _pos++;                        // SUBIMAGE
    _g_image[# _pos , 0 ] = _w; _pos++;                             // SUBIMAGE WIDTH
    _g_image[# _pos , 0 ] = background_get_height( _back ); _pos++; // SUBIMAGE HEIGHT
    _g_image[# _pos , 0 ] = _xorig; _pos++;                         // XORIGIN
    _g_image[# _pos , 0 ] = _yorig; _pos++;                         // YORIGIN
    
    for( var n = 0; n < _subimg; n++ ){
        surface_set_target( _surface );
        draw_clear_alpha( 0 , 0 );
        draw_background_part( _back , n * _w , 0 , n * _w + _w , background_get_height( _back ) , 0 , 0 );
        surface_reset_target();
        var _back_subimg = background_create_from_surface( _surface , 0 , 0 , _w , background_get_height( _back ) , false , false );
        ds_list_add( _l_background , _back_subimg );
        _g_image[# _pos , 0 ] = _back_subimg; _pos++; // BACKGROUND
        _g_image[# _pos , 0 ] = 0; _pos++;            // X
        _g_image[# _pos , 0 ] = 0; _pos++;            // Y
    }
    _g_image[# ds_grid_width( _g_image ) - 1 , 0 ] = __s_l_background_3d[| 5 ];
    
    ds_map_add( temp_sprite_get , _identifier , _g_image );
    surface_free( _surface );
    background_delete( _back );
    
    repeat( 6 ){
        ds_list_delete( __s_l_background_3d , 0 );
    }
}
draw_enable_alphablend( true );

// Clear memory
ds_list_destroy( _l_areas );
ds_list_destroy( __s_l_back_sorted );
ds_list_destroy( __s_l_background );
ds_list_destroy( __s_l_background_3d );
ds_list_destroy( _l_trash );
ds_list_destroy( _l_texpage );    


#define image_stream_progress
///image_stream_progress(group)
/*
    Returns a value from 0-1, the larger the value, the more has been loaded.
*/
var _l = global.m_ex_image[? argument0 ];
if( ds_list_size( _l ) != 3 ){
    show_error( "Image stream not started." + chr(13) + "Group: " + string( argument0 ) , true );
}
var _m = _l[| 2 ];
return _m[? "progress" ];



#define image_stream_start
///image_stream_start(group,tex_page_width,tex_page_height,tex_offset)
/*
    returns boolean;
*/
if( !ds_map_exists( global.m_ex_image , argument0 ) ){
    show_error( "Unknown image group '" + string( argument0 ) + "'" , true );
    return false;
}
var _l = global.m_ex_image[? argument0 ];
if( ds_list_size( _l ) != 2 ){
    if( ds_list_size( _l ) == 3 and ds_exists( _l[| 2 ] , ds_type_map ) ){
        show_error( "The image stream of the group '" + string( argument0 ) + "' has already started" , true );
        return false;
    } else {
        show_error( "Invalid group '" + string( argument0 ) + "', the data might have been edited from outside." , true );
        return false;
    }
}

var _m_stream = ds_map_create();
ds_list_add( _l , _m_stream );
ds_list_mark_as_map( _l , 2 );

_m_stream[? "w" ]         = argument1;
_m_stream[? "h" ]         = argument2;
_m_stream[? "sep" ]       = argument3;
/*ds_map_add_list( _m_stream , "l_back" , ds_list_create() );
ds_map_add_list( _m_stream , "l_back_3d" , ds_list_create() );*/
_m_stream[? "sprite" ]    = ds_priority_create();
_m_stream[? "sprite_3d" ] = ds_priority_create();
_m_stream[? "loading" ]   = ds_list_create();
_m_stream[? "loading_3d" ]= ds_list_create();
_m_stream[? "finished" ]  = true;
_m_stream[? "progress" ]  = 0;

return true;


#define image_stream_add
///image_stream_add(group,identifier,fname,subimg,xorig,yorig)
var _l = global.m_ex_image[? argument0 ];

// Error checking
if( ds_list_size( _l ) != 3 ){
    show_error( "Image stream not started " + chr(13) + "Group: " + string( argument0 ) + chr(13) + "Identifier " + string( argument1 ), true );
    return false; 
}

var _m = _l[| 2 ];
var _p_sprite = _m[? "sprite" ];

var _spr  = sprite_add( argument2 , argument3 , false , false , argument4 , argument5 );
var _priority = floor( ( sprite_get_width( _spr ) + sprite_get_height( _spr ) ) / 2 );
var _l = ds_list_create();

ds_list_add( _l , _spr , string( argument1 ) , argument2 );


if( _priority <= 1 and !file_exists( argument2 ) ){
    var _l_loading = _m[? "loading" ];
    ds_list_add( _l_loading , _l );
    _m[? "finished" ] = false;
}


ds_priority_add(
    _p_sprite ,
    _l ,
    _priority
);

// back_req , identifier , subimg , xorig , yorig , link , loaded




#define image_stream_add_3d
///image_stream_add_3d(group,identifier,fname,subimg,xorig,yorig)
var _l = global.m_ex_image[? argument0 ];

// Error checking
if( ds_list_size( _l ) != 3 ){
    show_error( "Image stream not started " + chr(13) + "Group: " + string( argument0 ) + chr(13) + "Identifier " + string( argument1 ), true );
    return false; 
}

var _m = _l[| 2 ];
var _p_sprite_3d = _m[? "sprite_3d" ];

var _spr = sprite_add( argument2 , argument3 , false , false , argument4 , argument5 );
var _priority = floor( ( sprite_get_width( _spr ) + sprite_get_height( _spr ) ) / 2 );
var _l = ds_list_create();

ds_list_add( _l , _spr , string( argument1 ) , argument2 );
if( _priority <= 1 and !file_exists( argument2 ) ){
    var _l_loading_3d = _m[? "loading_3d" ];
    ds_list_add( _l_loading_3d , _l );
    _m[? "finished" ] = false;
}

ds_priority_add(
    _p_sprite_3d ,
    _l ,
    _priority
);

// back_req , identifier , subimg , xorig , yorig , link , loaded




#define image_stream_receive
///image_stream_receive(group)
if( !ds_exists( async_load , ds_type_map ) ){
    show_error( "image_stream_receive() can only be used in Image Loaded event" , true );
    return false;
}

// Async data
var _id     = async_load[? "id" ];
var _fname  = async_load[? "filename" ];
var _status = async_load[? "status" ];

// Image stream data 
var _l = global.m_ex_image[? argument0 ];
if( ds_list_size( _l ) != 3 ){
    show_error( "Image stream not started." + chr(13) + "Group: " + string( argument0 ) , true );
}
var _m            = _l[| 2 ];
var _l_loading    = _m[? "loading" ];
var _l_loading_3d = _m[? "loading_3d" ];
var _p_sprite       = _m[? "sprite" ];
var _p_sprite_3d    = _m[? "sprite_3d" ];


// Check if we got the data.
for( var n = 0; n < ds_list_size( _l_loading ); n++ ){
    var _l_sprite = _l_loading[| n ];
    if( _l_sprite[| 0 ] == _id ){
        if( _status >= 0 ){
            show_debug_message( "RECEIVED " + string( _l_sprite[| 2 ] ) );
            ds_list_delete( _l_loading , n );
            n--;
            var _priority = ( sprite_get_width( _id ) + sprite_get_height( _id ) ) / 2;
            ds_priority_change_priority( _p_sprite , _l_sprite , _priority );
            continue;
        } else {
            show_debug_message( "Failed to load image, requesting again." + chr(13) + "Identifier: " + string( _l_sprite[| 1 ] ) + chr(13) + "Group: " + string( argument0 ) + chr(13) + "Error: " + string( _status ) );
            
            _l_sprite[| 0 ] = sprite_add( _l_sprite[| 2 ] , sprite_get_number( _id ) , false , false , sprite_get_xoffset( _id ) , sprite_get_yoffset( _id ) );
            sprite_delete( _id );
        }
    }
}

for( var n = 0; n < ds_list_size( _l_loading_3d ); n++ ){
    var _l_sprite = _l_loading_3d[| n ];
    if( _l_sprite[| 0 ] == _id ){
        if( _status >= 0 ){
            show_debug_message( "RECEIVED " + string( _l_sprite[| 2 ] ) );
            ds_list_delete( _l_loading_3d , n );
            n--;
            var _priority = ( sprite_get_width( _id ) + sprite_get_height( _id ) ) / 2;
            ds_priority_change_priority( _p_sprite_3d , _l_sprite , _priority );
            continue;
        } else {
            show_debug_message( "Failed to load image, requesting again." + chr(13) + "Identifier: " + string( _l_sprite[| 1 ] ) + chr(13) + "Group: " + string( argument0 ) + chr(13) + "Error: " + string( _status ) );
            
            _l_sprite[| 0 ] = sprite_add( _l_sprite[| 2 ] , sprite_get_number( _id ) , false , false , sprite_get_xoffset( _id ) , sprite_get_yoffset( _id ) );
            sprite_delete( _id );
        }
    }
}

var _total  = ds_priority_size( _p_sprite ) + ds_priority_size( _p_sprite_3d );
if( _total != 0 ){
    var _loaded = _total - ( ds_list_size( _l_loading ) + ds_list_size( _l_loading_3d ) );
    
    // FIX PROGRESS
    _m[? "progress" ] = _loaded / _total;
    _m[? "finished" ] = _loaded == _total;
}


#define image_stream_finish
///image_stream_finish(group)
if( !image_stream_is_received( string( argument0 ) ) ){
    show_error( "The image stream has not finished yet" + chr(13) + "Group: " + string( argument0 ) , true );
    return false;
}

var _l            = global.m_ex_image[? string( argument0 ) ];
var _l_image      = _l[| 0 ];
var _l_background = _l[| 1 ];
var _m_stream     = _l[| 2 ];

var _p_sprite    = _m_stream[? "sprite" ];
var _p_sprite_3d = _m_stream[? "sprite_3d" ];
var _width     = _m_stream[? "w" ];
var _height    = _m_stream[? "h" ];
var _sep       = _m_stream[? "sep" ];

draw_enable_alphablend( false );


// CREATE THE DATA STRUCTURES NECESSARY FOR ADDING THE SPRITES ON THE TEXTURE PAGE
var _l_areas = ds_list_create();
var _q_trash = ds_queue_create();
ds_list_add( _l_areas , 0 , 0 , _width , _height );

var _l_texpage = ds_list_create();
var _back = background_create_colour( _width , _height , c_black );
ds_list_add( _l_texpage , 
    surface_create( _width , _height ) , 
    _back
);

surface_set_target( _l_texpage[| ds_list_size( _l_texpage ) - 2 ] );
draw_clear_alpha( 0,0 ); // this can be removed
var _spr = -1;

while( ds_priority_size( _p_sprite ) ){ // LOOP THROUGH THE SPRITES AND ADD THEM TO THE TEXTURE PAGE WHERE POSSIBLE
    var _l_img = ds_priority_delete_max( _p_sprite );
    _spr = _l_img[| 0 ];
    
    var spr_number = sprite_get_number( _spr );
    var subimg_w = sprite_get_width( _spr );
    var _image_drawn = false;
    var _image_maindata_added = false;
    for( var i = 0; i < sprite_get_number( _spr ); i++ ){
        var _min_area_size = $10000000000000;
        var _min_area_id   = -1;
        for( var n = 0; n < ds_list_size( _l_areas ); n += 4 ){
            if( subimg_w <= _l_areas[| n + 2 ] and sprite_get_height( _spr ) <= _l_areas[| n + 3 ] ){
                if( ( ( _l_areas[| n + 2 ] + _l_areas[| n + 3 ] ) / 2 ) < _min_area_size ){
                    _min_area_size = ( _l_areas[| n + 2 ] + _l_areas[| n + 3 ] ) / 2;
                    _min_area_id = n;
                }
            }
        }
        
        // DRAW THE IMAGES ON THE TEXTURE PAGE
        if( _min_area_id != -1 ){
            n = _min_area_id;
            draw_sprite_part( _spr , i , 0  , 0 , subimg_w , sprite_get_height( _spr ) , _l_areas[| n ] , _l_areas[| n + 1 ] );
            
            _image_drawn = true;
            
            if( !_image_maindata_added ){
                // CREATE THE GRID FOR THE IMAGE DATA
                var _g_image = ds_grid_create( 7 + sprite_get_number( _spr ) * 3 , 1 );
                ds_list_add( _l_image , _g_image );
                var _pos = 0;
                // ADD THE MAIN DATA OF THE SPRITE TO THE SPRITE DATA STRUCTURE
                _g_image[# _pos , 0 ] = _l_img[| 1 ]; _pos++;              // IDENTIFIER
                _g_image[# _pos , 0 ] = sprite_get_number( _spr ); _pos++; // SUBIMAGE
                _g_image[# _pos , 0 ] = subimg_w; _pos++;                  // SUBIMAGE WIDTH
                _g_image[# _pos , 0 ] = sprite_get_height( _spr ); _pos++; // SUBIMAGE HEIGHT
                _g_image[# _pos , 0 ] = sprite_get_xoffset( _spr ); _pos++;// XORIGIN
                _g_image[# _pos , 0 ] = sprite_get_yoffset( _spr ); _pos++;// YORIGIN
                _image_maindata_added = true;
            }
            
            // ADD THE SUBIMAGE OF THE SPRITE TO THE SPRITE DATA STRUCTURE
            _g_image[# _pos , 0 ] = _back; _pos++;              // BACKGROUND
            _g_image[# _pos , 0 ] = _l_areas[| n ]; _pos++;     // X
            _g_image[# _pos , 0 ] = _l_areas[| n + 1 ]; _pos++; // Y
            
            if( i == sprite_get_number( _spr ) - 1 ){
                _g_image[# _pos , 0 ] = _l_img[| 2 ]; // FNAME
            }

            // ADD THE NEW EMPTY AREAS TO THE AREA LIST
            if( sprite_get_height( _spr ) < _l_areas[| n + 3 ] ){              // Y                                          W                           H
                ds_list_add( _l_areas , _l_areas[| n ] , _l_areas[| n + 1 ] + sprite_get_height( _spr ) + _sep , _l_areas[| n + 2 ] , _l_areas[| n + 3 ] - sprite_get_height( _spr ) - _sep );
            }
            if( subimg_w < _l_areas[| n + 2 ] ){ // X                                 Y                                          W                           H
                ds_list_add( _l_areas , _l_areas[| n ] + subimg_w + _sep , _l_areas[| n + 1 ] , _l_areas[| n + 2 ] - subimg_w - _sep , sprite_get_height( _spr ) );
            }
            
            // REMOVE THE CURRENT AREA FROM THE AREA LIST
            repeat( 4 )
                ds_list_delete( _l_areas , n );
        } else {
            ds_list_clear( _l_areas );
            ds_list_add( _l_areas , 0 , 0 , _width , _height );
            
            _back = background_create_colour( _width , _height , c_black );
            ds_list_add( _l_texpage , surface_create( _width , _height ) , _back);
            surface_reset_target();
            surface_set_target( _l_texpage[| ds_list_size( _l_texpage ) - 2 ] );
            draw_clear_alpha( 0,0 );
            
            i--;
        }
    }
    
    if( ds_list_size( _l_areas ) == 0 ){
        //show_debug_message( "Warning: Something went wrong, creating another texturepage" );
        
        ds_list_clear( _l_areas );
        ds_list_add( _l_areas , 0 , 0 , _width , _height );
        
        _back = background_create_colour( _width , _height , c_black );
        ds_list_add( _l_texpage , surface_create( _width , _height ) , _back );
        surface_reset_target();
        surface_set_target( _l_texpage[| ds_list_size( _l_texpage ) - 2 ] );
    }
    if( _image_drawn ){
        ds_list_destroy( _l_img );
        ds_queue_enqueue( _q_trash , _spr );
    }
}
surface_reset_target();

// Clear memory
while( ds_queue_size( _q_trash ) > 0 ){
    sprite_delete( ds_queue_dequeue( _q_trash ) );
}
// CREATE THE BACKGROUND (TEXTUREPAGE)
for( var n = 0; n < ds_list_size( _l_texpage ); n += 2 ){
    var _back_temp = background_create_from_surface( _l_texpage[| n ] , 0 , 0 , surface_get_width( _l_texpage[| n ] ) , surface_get_height( _l_texpage[| n ] ) , false , false );
    background_assign( _l_texpage[| n + 1 ] , _back_temp );
    ds_list_add( _l_background , _l_texpage[| n + 1 ] );
    background_delete( _back_temp );
    surface_free( _l_texpage[| n ] );
}


// 3D specific images.
while( ds_priority_size( _p_sprite_3d ) > 0 ){
    var _l_img      = ds_priority_delete_max( _p_sprite_3d );
    var _spr        = _l_img[| 0 ];
    var _identifier = _l_img[| 1 ];
    var _subimg     = sprite_get_number( _spr );
    var _xorig      = sprite_get_xoffset( _spr );
    var _yorig      = sprite_get_yoffset( _spr );;
    var _w          = sprite_get_width( _spr );
    var _surface    = surface_create( _w , sprite_get_height( _spr ) );
    
    var _g_image = ds_grid_create( 7 + _subimg * 3 , 1 );
    ds_list_add( _l_image , _g_image );
    var _pos = 0;
    _g_image[# _pos , 0 ] = _identifier; _pos++;                    // IDENTIFIER
    _g_image[# _pos , 0 ] = _subimg; _pos++;                        // SUBIMAGE
    _g_image[# _pos , 0 ] = _w; _pos++;                             // SUBIMAGE WIDTH
    _g_image[# _pos , 0 ] = sprite_get_height( _spr ); _pos++; // SUBIMAGE HEIGHT
    _g_image[# _pos , 0 ] = _xorig; _pos++;                         // XORIGIN
    _g_image[# _pos , 0 ] = _yorig; _pos++;                         // YORIGIN
    
    for( var n = 0; n < _subimg; n++ ){
        surface_set_target( _surface );
        draw_clear_alpha( 0 , 0 );
        draw_sprite_part( _spr , n , 0 , 0 , n * _w + _w , sprite_get_height( _spr ) , 0 , 0 );
        surface_reset_target();
        var _back_subimg = background_create_from_surface( _surface , 0 , 0 , _w , sprite_get_height( _spr ) , false , false );
        ds_list_add( _l_background , _back_subimg );
        _g_image[# _pos , 0 ] = _back_subimg; _pos++; // BACKGROUND
        _g_image[# _pos , 0 ] = 0; _pos++;            // X
        _g_image[# _pos , 0 ] = 0; _pos++;            // Y
    }
    _g_image[# ds_grid_width( _g_image ) - 1 , 0 ] = _l_img[| 2 ]; // FNAME
    
    surface_free( _surface );
    sprite_delete( _spr );
    ds_list_destroy( _l_img );
}
draw_enable_alphablend( true );

// Clear memory
ds_list_destroy( _l_areas );
ds_priority_destroy( _p_sprite );
ds_priority_destroy( _p_sprite_3d );
ds_list_destroy( _m_stream[? "loading" ] );
ds_list_destroy( _m_stream[? "loading_3d" ] );
ds_queue_destroy( _q_trash );
ds_list_destroy( _l_texpage );    
ds_list_delete( global.m_ex_image[? string( argument0 ) ] , 2 );

return true;


#define image_stream_is_active
///image_stream_is_active(group)
var _l = global.m_ex_image[? argument0 ];
return ds_list_size( _l ) == 3;


#define image_stream_is_received
///image_stream_is_received(group)
var _l = global.m_ex_image[? argument0 ];
if( ds_list_size( _l ) != 3 ){
    show_error( "Image stream not started." + chr(13) + "Group: " + string( argument0 ) , true );
    return false;
}
var _m = _l[| 2 ];
return _m[? "finished" ];



#define image_cache_create
///image_cache_create( group )
/*
    Creates a cache for the image group and returns the buffer that it is stored in,
    this can be saved using image_cache_save() or used in networking.
    
    -------------------------
        group - The group name or the name that image_group_create() returned.
    -------------------------
    
    RETURNS buffer or -1 if failed.
*/

if( ds_map_exists( global.m_ex_image , argument0 ) ){
    var _l = global.m_ex_image[? argument0 ];
    var _l_image      = _l[| 0 ];
    var _l_background = _l[| 1 ];
    
    // Temp directory
    var _dir = working_directory + ".TEMP_IMAGE_FOLDER/";
    if( directory_exists( _dir ) ){
        directory_destroy( _dir );
    }
    directory_create( _dir );
    
    // Create the cache and add safe checks
    var _buf_cache = buffer_create( 1 , buffer_grow , 1 );
    buffer_seek( _buf_cache , buffer_seek_start , 0 );
    buffer_write( _buf_cache , buffer_string , "IMAGE_CACHE" );
    buffer_write( _buf_cache , buffer_string , global.ex_image_cache_version );
    
    // Add the image to the cache
    buffer_write( _buf_cache , buffer_u16 , ds_list_size( _l_background ) );
    for( var n = 0; n < ds_list_size( _l_background ); n++ ){
        var _back = _l_background[| n ];
        background_save( _l_background[| n ] , _dir + string( _l_background[| n ] ) + ".png" );
        var _buf = buffer_load( _dir + string( _l_background[| n ] ) + ".png" );
        buffer_write( _buf_cache , buffer_u32 , buffer_get_size( _buf ) );
        buffer_copy( _buf , 0 , buffer_get_size( _buf ) , _buf_cache , buffer_tell( _buf_cache ) );
        
        buffer_seek( _buf_cache , buffer_seek_relative , buffer_get_size( _buf ) );
        buffer_delete( _buf );
    }
    
    // Write the image info into the cache
    buffer_write( _buf_cache , buffer_u16 , ds_list_size( _l_image ) );
    for( var n = 0; n < ds_list_size( _l_image ); n++ ){
        var _g       = _l_image[| n ];
        var _id      = _g[# 0 , 0 ];
        var _subimg  = _g[# 1 , 0 ];
        var _width   = _g[# 2 , 0 ];
        var _height  = _g[# 3 , 0 ];
        var _xorigin = _g[# 4 , 0 ];
        var _yorigin = _g[# 5 , 0 ];
        
        buffer_write( _buf_cache , buffer_string , string( _id )  );
        buffer_write( _buf_cache , buffer_u16 , _subimg  );
        buffer_write( _buf_cache , buffer_u16 , _width   );
        buffer_write( _buf_cache , buffer_u16 , _height  );
        buffer_write( _buf_cache , buffer_s16 , _xorigin );
        buffer_write( _buf_cache , buffer_s16 , _yorigin );
        
        for( var i = 0; i < _subimg; i++ ){
            var _index = ds_list_find_index( _l_background , _g[# 6 + i * 3 , 0 ] );
            if( _index != -1 )
                buffer_write( _buf_cache , buffer_u16 , _index );//_g[# 6 + i * 3 , 0 ] );
            else
                show_error( "The texturepage with id '" + string( _g[# 6 + i * 3 , 0 ] ) + "' Couldn't be found in the group background ds_list" , true );
            buffer_write( _buf_cache , buffer_u16 , _g[# 7 + i * 3 , 0 ] );
            buffer_write( _buf_cache , buffer_u16 , _g[# 8 + i * 3 , 0 ] );
        }
        buffer_write( _buf_cache , buffer_string , string( _g[# ds_grid_width( _g ) - 1 , 0 ] ) );
    }
    buffer_resize( _buf_cache , buffer_tell( _buf_cache ) );
    directory_destroy( _dir );
    return _buf_cache;
} else {
    show_error( "The image group '" + string( argument0 ) + "' you are trying to save does not exist" , false );
    return -1;
}


#define image_cache_save
///image_cache_save(cache,fname)
gml_pragma( "forceinline" );
/* 
    Saves the cache as the fname.
    
    NOTE: Sandboxing restrictions apply
    
    -------------------------
        cache - The buffer that image_cache_create() or image_cache_load() returned.
        fname - The name of the file to save as. 
    -------------------------
    
    RETURNS boolean which shows whether the file was saved and created successfully or not
*/

buffer_save( argument0 , argument1 );


#define image_cache_load
///image_cache_load(fname)
gml_pragma( "forceinline" );
/*
    Loads the image cache file in as a buffer and checks 
    whether the file is an image cache that is supported. 
    This can be used for networking.
    
    -------------------------
        fname -  The name of the file to load. 
    -------------------------
    
    RETURNS the buffer id or -1 if it either fails or the cache is the wrong format.
*/

if( !file_exists( argument0 ) ){
    show_error( "The image group file '" + string( argument0 ) + "' does not exist" , true );
    return -1;
}

// Load the cache
var _buf_cache = buffer_load( argument0 );

// Detect whether the file is an actual image cache file and check if the version is supported.
if( buffer_read( _buf_cache , buffer_string ) != "IMAGE_CACHE" ){
    show_error( "The file '" + string( argument0 ) + "' for the group '" + string( argument0 ) + "' is not an image cache!" , false );
    buffer_delete( _buf_cache );
    return -1;
}
var _cache_version = buffer_read( _buf_cache , buffer_string );
switch( _cache_version ){
    case global.ex_image_cache_version: break; // Current version, no converting needed.
    
    default:
        show_error( "The image cache version in file '" + string( argument0 ) + "' is not supported!" , false );
        buffer_delete( _buf_cache );
        return -1;
    break;
}
buffer_seek( _buf_cache , buffer_seek_start , 0 );
return _buf_cache;



#define image_cache_delete
///image_cache_delete(cache)
gml_pragma( "forceinline" );
/*
    Deletes the image cache
    
    -------------------------
        cache - The buffer that image_cache_create() or image_cache_load() returned.
    -------------------------
*/
buffer_delete( argument0 );


#define image_cache_unpack
///image_cache_unpack( group , cache )
/*
    Unpacks the image cache into the group.
    
    NOTE: If the group exists, it will be deleted and rewritten using ONLY the data in the cache. 
          If the group doesn't exist, no data will be overwritten.
    
    -------------------------
        group - The group name or the name that image_group_create() returned.
    -------------------------
    
    RETURNS boolean, which shows whether it unpacks or failed to unpack.
*/


// Load the cache
var _buf_cache = argument1;
buffer_seek( _buf_cache , buffer_seek_start , 0 );

// Detect whether the file is an actual image cache file and check if the version is supported.
if( buffer_read( _buf_cache , buffer_string ) != "IMAGE_CACHE" ){
    show_error( "The buffer '" + string( argument1 ) + "' for the group '" + string( argument0 ) + "' is not an image cache!" , false );
    return false;
}
var _cache_version = buffer_read( _buf_cache , buffer_string );
switch( _cache_version ){
    case global.ex_image_cache_version: break; // Current version, no converting needed.
    
    default:
        show_error( "The image cache version '" + string( _cache_version ) + "' in buffer '" + string( argument1 ) + "' is not supported!" , false );
        return false;
    break;
}

// Empty or create the group
if( ds_map_exists( global.m_ex_image , argument0 ) ){
    image_group_clear( argument0 );
    var _l            = global.m_ex_image[? argument0 ];
    var _l_image      = _l[| 0 ];
    var _l_background = _l[| 1 ];
} else {
    var _l = ds_list_create();
    ds_map_add_list( global.m_ex_image , argument0 , _l );
    var _l_image      = ds_list_create();
    var _l_background = ds_list_create();
    _l[| 0 ]          = _l_image;      // Image data list
    _l[| 1 ]          = _l_background; // Background list
    ds_list_mark_as_list( _l , 0 );
    ds_list_mark_as_list( _l , 1 );
}


// Temp directory for extracting the cache
var _dir = working_directory + ".TEMP_IMAGE_FOLDER/";
if( directory_exists( _dir ) ){
    directory_destroy( _dir );
}
directory_create( _dir );

// Load the textures
var _tex_count = buffer_read( _buf_cache , buffer_u16 );
for( var n = 0; n < _tex_count; n++ ){
    var _size = buffer_read( _buf_cache , buffer_u32 );
    buffer_save_ext( _buf_cache , _dir + string( n ) + ".png" , buffer_tell( _buf_cache ) , _size );
    buffer_seek( _buf_cache , buffer_seek_relative , _size );
    
    var _back = background_add( _dir + string( n ) + ".png" , false , false );
    ds_list_add( _l_background , _back );
}

directory_destroy( _dir );

// Load the image information
var _image_count = buffer_read( _buf_cache , buffer_u16 );
repeat( _image_count ){
    var _id      = buffer_read( _buf_cache , buffer_string );
    var _subimg  = buffer_read( _buf_cache , buffer_u16 );
    var _width   = buffer_read( _buf_cache , buffer_u16 );
    var _height  = buffer_read( _buf_cache , buffer_u16 );
    var _xorigin = buffer_read( _buf_cache , buffer_s16 );
    var _yorigin = buffer_read( _buf_cache , buffer_s16 );
    
    var _g_image = ds_grid_create( 7 + _subimg * 3 , 1 );
    ds_list_add( _l_image , _g_image );
    
    _g_image[# 0 , 0 ] = _id;
    _g_image[# 1 , 0 ] = _subimg;
    _g_image[# 2 , 0 ] = _width;
    _g_image[# 3 , 0 ] = _height;
    _g_image[# 4 , 0 ] = _xorigin;
    _g_image[# 5 , 0 ] = _yorigin;
    
    for( var i = 0; i < _subimg; i++ ){
        var _index = buffer_read( _buf_cache , buffer_u16 ); // background
        var _x     = buffer_read( _buf_cache , buffer_u16 ); // x
        var _y     = buffer_read( _buf_cache , buffer_u16 ); // y
        _g_image[# 6 + i * 3 , 0 ] = _l_background[| _index ];
        _g_image[# 7 + i * 3 , 0 ] = _x;
        _g_image[# 8 + i * 3 , 0 ] = _y;
    }
    
    _g_image[# ds_grid_width( _g_image ) - 1 , 0 ] = buffer_read( _buf_cache , buffer_string ); // filename
}

return true;



#define image_exists
///image_exists(image)
gml_pragma("forceinline");

if( ds_exists( argument0 , ds_type_grid ) ){
    if( ds_grid_height( argument0 ) == 1 ){
        return true;
    } else {
        return false;
    }
} else {
    return false;
}


#define image_get_filename
///image_get_filename(ind)
gml_pragma("forceinline"); 
return( argument0[# ds_grid_width( argument0 ) - 1 , 0 ] );


#define image_get_number
///image_get_number(ind)
gml_pragma("forceinline"); 
return( argument0[# 1 , 0 ] );


#define image_get_identifier
///image_get_identifier(ind)
gml_pragma("forceinline"); 
return( argument0[# 0 , 0 ] );


#define image_get_width
///image_get_width(ind)
gml_pragma("forceinline"); 
return( argument0[# 2 , 0 ] );


#define image_get_height
///image_get_height(ind)
gml_pragma("forceinline"); 
return( argument0[# 3 , 0 ] );


#define image_get_xoffset
///image_get_xoffset(ind)
gml_pragma("forceinline");
return( argument0[# 4 , 0 ] );


#define image_get_yoffset
///image_get_yoffset(ind)
gml_pragma("forceinline");
return( argument0[# 5 , 0 ] );


#define image_get_uvs
///image_get_uvs(spr,subimg)
gml_pragma("forceinline");
var _c_subimg = ( floor(argument1) mod argument0[# 1 , 0 ] ) * 3;
var _bck = argument0[# 6 + _c_subimg , 0 ];

var _ar;
_ar[ 0 ] = argument0[# 7 + _c_subimg , 0 ] / background_get_width( _bck );
_ar[ 1 ] = argument0[# 8 + _c_subimg , 0 ] / background_get_width( _bck );
_ar[ 2 ] = (argument0[# 7 + _c_subimg , 0 ] + argument0[# 2 , 0 ]) / background_get_width( _bck );
_ar[ 3 ] = (argument0[# 8 + _c_subimg , 0 ] + argument0[# 3 , 0 ]) / background_get_width( _bck );
return( _ar );


#define image_set_offset
///image_set_offset(ind,xoffset,yoffset)
gml_pragma("forceinline");
argument0[# 4 , 0 ] = argument1;
argument0[# 5 , 0 ] = argument2;


#define image_get_texturepage
///image_get_texturepage(sprite,subimg)
gml_pragma("forceinline"); 

var _c_subimg = ( floor(argument1) mod argument0[# 1 , 0 ] ) * 3;
return( argument0[# 6 + _c_subimg , 0 ] );


#define image_get_texture
///image_get_texture(sprite,subimg)
gml_pragma("forceinline"); 

var _c_subimg = ( floor(argument1) mod argument0[# 1 , 0 ] ) * 3;
return( background_get_texture( argument0[# 6 + _c_subimg , 0 ] ) );


#define image_save
///image_save(ind,subimg,fname)
var _c_subimg = ( floor(argument1) mod argument0[# 1 , 0 ] ) * 3;

var _surf = surface_create( argument0[# 2 , 0 ] , argument0[# 3 , 0 ] );

surface_set_target( _surf );
    draw_clear_alpha( 0 , 0 );
    draw_background_part(
        argument0[# 6 + _c_subimg , 0 ] , 
        argument0[# 7 + _c_subimg , 0 ] ,
        argument0[# 8 + _c_subimg , 0 ] ,
        argument0[# 2 , 0 ] ,
        argument0[# 3 , 0 ] ,
        0 ,
        0
    );
surface_reset_target();
surface_save( _surf , argument2 );
surface_free( _surf );


#define image_save_strip
///image_save_strip(ind,fname)
var _subimg_count = argument0[# 1 , 0 ];

var _surf = surface_create( argument0[# 2 , 0 ] * _subimg_count , argument0[# 3 , 0 ] );
surface_set_target( _surf );
    draw_clear_alpha( 0 , 0 );
    for( var n = 0; n < _subimg_count; n++ ){
        draw_background_part(
            argument0[# 6 + n*3 , 0 ] , 
            argument0[# 7 + n*3 , 0 ] ,
            argument0[# 8 + n*3 , 0 ] ,
            argument0[# 2 , 0 ] ,
            argument0[# 3 , 0 ] ,
            argument0[# 2 , 0 ] * n ,
            0
        );
    }
surface_reset_target();

surface_save( _surf , argument1 );
surface_free( _surf );