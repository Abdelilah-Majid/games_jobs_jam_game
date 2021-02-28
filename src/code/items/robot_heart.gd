extends Sprite

export var health_value=100

func _on_Area2D_body_entered(body: Node) -> void:
	global_players_script.robot_health+=health_value
	queue_free()
