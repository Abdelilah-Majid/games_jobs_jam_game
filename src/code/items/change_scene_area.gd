extends Area2D



export(String, FILE) var next_scene=""




func _on_change_scene_body_entered(body: Node) -> void:
	get_tree().change_scene(next_scene)
