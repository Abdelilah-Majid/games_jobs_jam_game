extends Sprite




func _physics_process(delta: float) -> void:
	if global_water_player_script.is_water_button_activated:
		modulate=Color(0,1,0,1)
	else :
		modulate=Color(1,0,0,1)


func _on_Area2D_body_entered(body: Node) -> void:
	global_water_player_script.is_water_player_collide_with_water_button=true


func _on_Area2D_body_exited(body: Node) -> void:
	global_water_player_script.is_water_player_collide_with_water_button=false
