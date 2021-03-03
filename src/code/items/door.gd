extends Sprite


var change_scene=preload("res://src/objects/change_scene.tscn")

func _physics_process(delta: float) -> void:
	if global_players_script.is_open_door_platforms_active.size()==2:
		change_scene.instance()
		add_child(change_scene)
		change_scene.global_position=Vector2(104.155,62.05)
