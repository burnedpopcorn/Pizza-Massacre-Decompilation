enum view_Set
{
	XView,
	YView,
	WView,
	HView,
	Angle,
	HBorder,
	VBorder,
	HSpeed,
	VSpeed,
	Object,
	Visible,
	XPort,
	YPort,
	WPort,
	HPort,
	Camera,
	SurfaceID
}
function __view_set_internal(argument0, argument1, argument2)
{
    var __prop, __index, __val, __cam;
    
    __prop = argument0;
    __index = argument1;
    __val = argument2;
    
    switch (__prop)
    {
        case view_Set.XView:
            __cam = view_get_camera(__index);
            camera_set_view_pos(__cam, __val, camera_get_view_y(__cam));
            break;
        
        case view_Set.YView:
            __cam = view_get_camera(__index);
            camera_set_view_pos(__cam, camera_get_view_x(__cam), __val);
            break;
        
        case view_Set.WView:
            __cam = view_get_camera(__index);
            camera_set_view_size(__cam, __val, camera_get_view_height(__cam));
            break;
        
        case view_Set.HView:
            __cam = view_get_camera(__index);
            camera_set_view_size(__cam, camera_get_view_width(__cam), __val);
            break;
        
        case view_Set.Angle:
            __cam = view_get_camera(__index);
            camera_set_view_angle(__cam, __val);
            break;
        
        case view_Set.HBorder:
            __cam = view_get_camera(__index);
            camera_set_view_border(__cam, __val, camera_get_view_border_y(__cam));
            break;
        
        case view_Set.VBorder:
            __cam = view_get_camera(__index);
            camera_set_view_border(__cam, camera_get_view_border_x(__cam), __val);
            break;
        
        case view_Set.HSpeed:
            __cam = view_get_camera(__index);
            camera_set_view_speed(__cam, __val, camera_get_view_speed_y(__cam));
            break;
        
        case view_Set.VSpeed:
            __cam = view_get_camera(__index);
            camera_set_view_speed(__cam, camera_get_view_speed_x(__cam), __val);
            break;
        
        case view_Set.Object:
            __cam = view_get_camera(__index);
            camera_set_view_target(__cam, __val);
            break;
        
        case view_Set.Visible:
            __res = view_set_visible(__index, __val);
            break;
        
        case view_Set.XPort:
            __res = view_set_xport(__index, __val);
            break;
        
        case view_Set.YPort:
            __res = view_set_yport(__index, __val);
            break;
        
        case view_Set.WPort:
            __res = view_set_wport(__index, __val);
            break;
        
        case view_Set.HPort:
            __res = view_set_hport(__index, __val);
            break;
        
        case view_Set.Camera:
            __res = view_set_camera(__index, __val);
            break;
        
        case view_Set.SurfaceID:
            __res = view_set_surface_id(__index, __val);
            break;
        
        case 0:
            __cam = view_get_camera(__index);
            camera_set_view_pos(__cam, __val, camera_get_view_y(__cam));
            break;
        
        case 1:
            __cam = view_get_camera(__index);
            camera_set_view_pos(__cam, camera_get_view_x(__cam), __val);
            break;
        
        case 2:
            __cam = view_get_camera(__index);
            camera_set_view_size(__cam, __val, camera_get_view_height(__cam));
            break;
        
        case 3:
            __cam = view_get_camera(__index);
            camera_set_view_size(__cam, camera_get_view_width(__cam), __val);
            break;
        
        case 4:
            __cam = view_get_camera(__index);
            camera_set_view_angle(__cam, __val);
            break;
        
        case 5:
            __cam = view_get_camera(__index);
            camera_set_view_border(__cam, __val, camera_get_view_border_y(__cam));
            break;
        
        case 6:
            __cam = view_get_camera(__index);
            camera_set_view_border(__cam, camera_get_view_border_x(__cam), __val);
            break;
        
        case 7:
            __cam = view_get_camera(__index);
            camera_set_view_speed(__cam, __val, camera_get_view_speed_y(__cam));
            break;
        
        case 8:
            __cam = view_get_camera(__index);
            camera_set_view_speed(__cam, camera_get_view_speed_x(__cam), __val);
            break;
        
        case 9:
            __cam = view_get_camera(__index);
            camera_set_view_target(__cam, __val);
            break;
        
        case 10:
            __res = view_set_visible(__index, __val);
            break;
        
        case 11:
            __res = view_set_xport(__index, __val);
            break;
        
        case 12:
            __res = view_set_yport(__index, __val);
            break;
        
        case 13:
            __res = view_set_wport(__index, __val);
            break;
        
        case 14:
            __res = view_set_hport(__index, __val);
            break;
        
        case 15:
            __res = view_set_camera(__index, __val);
            break;
        
        case 16:
            __res = view_set_surface_id(__index, __val);
            break;
        
        default:
            break;
    }
    
    return 0;
}
