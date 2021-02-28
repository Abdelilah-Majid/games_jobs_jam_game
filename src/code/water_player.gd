extends Actor




var id_name="water"
var old_speed:=speed
var is_walking_on_water_active:=false


var jump_sounds_arr=[
	preload("res://assets/audio/Sound Design/Atlea/Atlea Jump/Jump_01.ogg"),
	preload("res://assets/audio/Sound Design/Atlea/Atlea Jump/Jump_02.ogg"),
	preload("res://assets/audio/Sound Design/Atlea/Atlea Jump/Jump_03.ogg")
	]
var jump_sound_arr_index=0


var olde_gravity=gravity
func _physics_process(delta: float) -> void:
	if global_players_script.what_player_is_in_water=="water" :
		gravity=0
		is_water_player_is_in_water=true
	else:
		gravity=olde_gravity
		is_water_player_is_in_water=false
	_get_y_direction()
	
	if global_players_script.what_player_is_in_water!="water" && global_players_script.current_player=="water" :
		if Input.is_action_just_pressed("l_key"):
			is_walking_on_water_active=!is_walking_on_water_active
			change_walking_on_wter_state(is_walking_on_water_active)
	
	
	
	if global_players_script.current_player=="robot":
		get_node("Camera2D").current=false
		speed=Vector2(0.0,0.0)
		y_direction=0
	if global_players_script.current_player=="water":
		get_node("Camera2D").current=true
		speed=old_speed
	
	if global_water_player_script.is_water_player_collide_with_water_button && global_players_script.current_player=="water":
		if Input.is_action_just_pressed("space_key"):
			global_water_player_script.is_water_button_activated=!global_water_player_script.is_water_button_activated
	
	
	check_play_sound()

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
	


func check_play_sound()->void:
	
	if is_on_floor() && Input.is_action_just_pressed("jump") && global_players_script.current_player=="water" && !global_water_player_script.is_in_water:
		get_node("jump_sound_player").play()
		get_node("jump_sound_player").stream=jump_sounds_arr[jump_sound_arr_index]
		
		jump_sound_arr_index+=1
		if jump_sound_arr_index==3:
			jump_sound_arr_index=0
	
	
	if global_water_player_script.is_player_walking_on_water && !get_node("walk_on_water_sound_player3").is_playing() && direction.x!=0 && is_walking_on_water_active && global_players_script.current_player=="water":
		get_node("walk_on_water_sound_player3").play()
	if get_node("walk_on_water_sound_player3").is_playing() && direction.x==0:
		get_node("walk_on_water_sound_player3").stop()
	if get_node("walk_on_water_sound_player3").is_playing() && !global_water_player_script.is_player_walking_on_water:
		get_node("walk_on_water_sound_player3").stop()
	
	if is_on_floor() && !get_node("walk_sound_player2").is_playing() && global_players_script.current_player=="water" && ! global_water_player_script.is_player_walking_on_water && direction.x!=0:
		get_node("walk_sound_player2").play()
	if direction.x==0:
		get_node("walk_sound_player2").stop()
	if global_water_player_script.is_in_water:
		get_node("walk_sound_player2").stop()
	if global_water_player_script.is_player_walking_on_water:
		get_node("walk_sound_player2").stop()
	




func show_small_popup()->void:
	get_node("small_popup/AnimationPlayer").play("show")
func hide_small_popup()->void:
	get_node("small_popup/AnimationPlayer").play("hide")

func toggle_text_popup()->void:
	get_node("text_popup").visible=!get_node("text_popup").visible
func change_text_popup_text(text:String):
	get_node("small_popup/Label").text=text

