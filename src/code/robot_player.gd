extends Actor


var id_name="robot"
var old_speed:=speed
var is_moving_to_right=true
func _physics_process(delta):
	
	for i in range(get_slide_count() - 1):
		var collision = get_slide_collision(i)
		
		if collision.collider.get_collision_layer_bit(4)==true:
			collision.collider.push(get_direction().x)
	
	
	if Input.is_action_just_pressed("move_right") && global_players_script.current_player=="robot":
		if !is_moving_to_right:
			scale.x=-1
			is_moving_to_right=true
	if Input.is_action_just_pressed("move_left") && global_players_script.current_player=="robot":
		if is_moving_to_right:
			scale.x=-1
			is_moving_to_right=false
	
	
	if (Input.is_action_pressed("move_left")  || Input.is_action_pressed("move_right")) && global_players_script.current_player=="robot":
		get_node("Golem/AnimationPlayer").play("Walk")
	if !(Input.is_action_pressed("move_left")  || Input.is_action_pressed("move_right")):
		get_node("Golem/AnimationPlayer").play("Idle")
	
	
	
	if global_players_script.current_player=="water":
		get_node("Camera2D").current=false
		speed=Vector2(0.0,0.0)
		
	if global_players_script.current_player=="robot":
		get_node("Camera2D").current=true
		speed=old_speed
		speed.y=0
	

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
