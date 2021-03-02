extends StaticBody2D

var arr=[]

func _on_Area2D_body_entered(body: Node) -> void:
	if global_players_script.lighting_braziers>=3:
		get_node("active").visible=true
		get_node("disable").visible=false
		global_players_script.is_open_door_platforms_active.push_back(true)
	


func _on_Area2D_body_exited(body: Node) -> void:
	if global_players_script.lighting_braziers>=3:
		get_node("disable").visible=true
		get_node("active").visible=false
		global_players_script.is_open_door_platforms_active.pop_back()
