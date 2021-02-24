extends Actor

func _ready() -> void:
	pass



func toggle_small_popup()->void:
	get_node("small_popup").visible=!get_node("small_popup").visible
