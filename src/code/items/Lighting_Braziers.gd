extends Sprite


var is_added=false
func _on_Area2D_body_entered(body: Node) -> void:
	if !is_added:
		global_players_script.lighting_braziers+=1
		is_added=true
