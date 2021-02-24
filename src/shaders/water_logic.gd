extends StaticBody2D



func _on_Area2D_body_entered(body: Node) -> void:
	global_water_player_script.is_in_water=true
	global_water_player_script.water_that_we_are_colliding_with_position=global_position
	print(global_water_player_script.water_that_we_are_colliding_with_position)


func _on_Area2D_body_exited(body: Node) -> void:
	global_water_player_script.is_in_water=false
	


func _ready() -> void:
	visible=true

