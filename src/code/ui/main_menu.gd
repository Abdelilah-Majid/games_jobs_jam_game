extends CanvasLayer

export (String, FILE) var level_1=""

func _on_play_button_up() -> void:
	get_tree().change_scene(level_1)


func _on_quit_button_up() -> void:
	get_tree().quit()
