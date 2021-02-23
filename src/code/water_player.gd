extends Actor




var olde_gravity=gravity
func _physics_process(delta: float) -> void:
	if global_water_player_script.is_in_water==true:
		gravity=0
		is_water_player_is_in_water=true
	else:
		gravity=olde_gravity
		is_water_player_is_in_water=false
	_get_y_direction()
	
	print(y_direction)


func _get_y_direction()->void:
	if Input.is_action_pressed("jump"):
		y_direction=-1.0
	elif Input.is_action_pressed("move_down"):
		y_direction=1.0
	else:
		y_direction=0
	
