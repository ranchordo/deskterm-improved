if (get_application_name()=="Terminal") then
	if (get_window_role()=="Deskterm") then
		set_window_position(0, 0);
		maximize();
		set_window_type("WINDOW_TYPE_DESKTOP");
		pin_window();
		focus_window();
		undecorate_window();
	end
end
