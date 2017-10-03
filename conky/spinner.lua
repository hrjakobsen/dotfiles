require 'cairo'

function conky_main()
    if conky_window == nil then
        return
    end
    local cs = cairo_xlib_surface_create(conky_window.display,
                                         conky_window.drawable,
                                         conky_window.visual,
                                         conky_window.width,
                                         conky_window.height)
    cr = cairo_create(cs)
   
	cairo_select_font_face (cr, "mono", CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_NORMAL);
    cairo_set_font_size (cr, 12)
    cairo_set_source_rgba (cr,1,1,1,1)
    cairo_move_to (cr,100,100)
    cairo_show_text (cr,"hello world")
    cairo_stroke (cr) 

	cairo_destroy(cr)
    cairo_surface_destroy(cs)
    cr=nil
end
