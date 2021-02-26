extends StaticBody2D



func _on_Area2D_body_entered(body: Node) -> void:
	global_water_player_script.is_in_water=true


func _on_Area2D_body_exited(body: Node) -> void:
	global_water_player_script.is_in_water=false
	


func _ready() -> void:
	visible=true



func _on_walking_on_water_body_entered(body: Node) -> void:
	global_water_player_script.is_player_walking_on_water=true

func _on_walking_on_water_body_exited(body: Node) -> void:
	global_water_player_script.is_player_walking_on_water=false
