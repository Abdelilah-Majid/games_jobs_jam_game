extends KinematicBody2D


var id="boulder0"
var velocity=Vector2()
export var push_speed:=1000
export var gravity=4000.0
var timer_is_on=false

func _ready() -> void:
	velocity.y=gravity

func _physics_process(delta: float) -> void:
	if global_players_script.current_player=="water":
		velocity.x=0
	move_and_slide(velocity,Vector2.UP)
	


func push(x)->void:
	velocity.x=x*push_speed
	#move_and_slide(velocity,Vector2.UP)
	#velocity.x=0
	if !is_on_floor()&&!timer_is_on:
		get_node("edg_fix").start()
		velocity.y=0
		timer_is_on=true
		
	
	
	


func _on_Timer_timeout() -> void:
	velocity.y=gravity
	get_node("fall_wait").start()


func _on_fall_wait_timeout() -> void:
	timer_is_on=false
