extends Actor


var id_name="robot"
var old_speed:=speed


func _physics_process(delta):
	
	for i in range(get_slide_count() - 1):
		var collision = get_slide_collision(i)
		print()
		if collision.collider.get_collision_layer_bit(4)==true:
			collision.collider.push(get_direction().x)
		
		
		
		
	if global_players_script.current_player=="water":
		get_node("Camera2D").current=false
		speed=Vector2(0.0,0.0)
	if global_players_script.current_player=="robot":
		get_node("Camera2D").current=true
		speed=old_speed

	check_for_change_player_action()
	


func check_for_change_player_action()->String:
	if Input.is_action_just_pressed("k_key"):
		if global_players_script.current_player=="robot":
			global_players_script.current_player="water"
			print(global_players_script.current_player)
			return "a"
		if global_players_script.current_player=="water":
			global_players_script.current_player="robot"
			print(global_players_script.current_player)
			return "b"
	return "c"
