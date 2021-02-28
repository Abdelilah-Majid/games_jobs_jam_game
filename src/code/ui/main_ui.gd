extends CanvasLayer

export var robot_health_decay_value=0.01

func _physics_process(delta: float) -> void:
	get_node("TextureProgress").value=global_players_script.robot_health
	global_players_script.robot_health-=robot_health_decay_value
