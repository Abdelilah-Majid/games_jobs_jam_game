extends KinematicBody2D


var id="boulder0"
var velocity=Vector2()
export var push_speed:=1000
export var gravity=4000.0

func _ready() -> void:
	velocity.y=gravity

func _physics_process(delta: float) -> void:
	move_and_slide(velocity,Vector2.UP)
	velocity.x=0
	pass
func push(x)->void:
	velocity.x=x*push_speed
	#move_and_slide(velocity,Vector2.UP)
	#velocity.x=0
	
	pass
