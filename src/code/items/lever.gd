extends Area2D



var is_player_colliding=false
var is_activated=false

func _on_Area2D_body_entered(body: Node) -> void:
	is_player_colliding=true

func _on_Area2D_body_exited(body: Node) -> void:
	is_player_colliding=false



func _physics_process(delta: float) -> void:
	if is_player_colliding && Input.is_action_just_pressed("space_key"):
		get_node("Node2D").rotation_degrees*=-1
		is_activated=!is_activated
		if is_activated:
			get_node("active").visible=true
			get_node("disable").visible=false
		if !is_activated:
			get_node("active").visible=false
			get_node("disable").visible=true
