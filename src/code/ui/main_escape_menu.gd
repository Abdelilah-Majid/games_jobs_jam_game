extends CanvasLayer



func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("reset_key"):
		get_tree().reload_current_scene()
	
	if Input.is_action_just_pressed("escape_key"):
		get_node("Control").visible=!get_node("Control").visible
		get_node("Control/ParallaxBackground/ParallaxLayer").visible=!get_node("Control/ParallaxBackground/ParallaxLayer").visible
	print(OS.get_scancode_string(32))
	


func _on_resume_button_up() -> void:
	get_node("Control").visible=!get_node("Control").visible
	get_node("Control/ParallaxBackground/ParallaxLayer").visible=!get_node("Control/ParallaxBackground/ParallaxLayer").visible



func _on_replay_button_up() -> void:
	get_tree().reload_current_scene()


func _on_quit_button_down() -> void:
	get_tree().quit()


func _on_go_back_to_menu_button_up() -> void:
	get_tree().change_scene("res://UI/main_menu.tscn")
