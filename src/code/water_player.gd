extends Actor

var old_speed:=speed
var is_walking_on_water_active=false

var olde_gravity=gravity
func _physics_process(delta: float) -> void:
	if global_water_player_script.is_in_water==true:
		gravity=0
		is_water_player_is_in_water=true
	else:
		gravity=olde_gravity
		is_water_player_is_in_water=false
	_get_y_direction()
	
	if !global_water_player_script.is_in_water:
		if Input.is_action_just_pressed("l_key"):
			is_walking_on_water_active=!is_walking_on_water_active
			change_walking_on_wter_state(is_walking_on_water_active)
	
#	if is_on_wall():
#		speed.x=0
#	elif speed.x==0:
#		speed=old_speed
	print(is_on_wall())


func change_walking_on_wter_state(is_walking_on_water_active:bool)->void:
	set_collision_mask_bit(2,is_walking_on_water_active)
	pass


func _get_y_direction()->void:
	if Input.is_action_pressed("jump"):
		y_direction=-1.0
	elif Input.is_action_pressed("move_down"):
		y_direction=1.0
	else:
		y_direction=0
	
