extends KinematicBody2D
class_name Actor

const FLOOR_NORMAL:=Vector2.UP
export var speed:=Vector2(300.0,1000.0)
var direction:=Vector2()
export var water_speed=100.0
export var gravity:=4000.0
var _velocity:=Vector2.ZERO
var y_direction
var is_water_player_is_in_water=false

func _physics_process(delta: float) -> void:
	
	var is_jump_interrupted:=Input.is_action_just_released("jump") and _velocity.y < 0.0
	direction=get_direction()
	_velocity=calculate_move_velocity(direction,speed,_velocity,is_jump_interrupted)
	_velocity=move_and_slide(_velocity, FLOOR_NORMAL)
	
	
	
	return



func get_direction()->Vector2:
	if !is_water_player_is_in_water:
		y_direction=-1.0 if Input.is_action_just_pressed("jump") and is_on_floor() else 1.0
	
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		y_direction
	)


func calculate_move_velocity(direction:Vector2,speed:Vector2,linear_velocity:Vector2,is_jump_interrupted:bool)->Vector2:
	var new_velocity:=linear_velocity
	
	new_velocity.x=speed.x*direction.x
	if !is_water_player_is_in_water:
		new_velocity.y+=gravity*get_physics_process_delta_time()
	else:
		new_velocity.y=water_speed*direction.y
	
	
	if direction.y ==-1.0 and !is_water_player_is_in_water:
		new_velocity.y=direction.y*speed.y
	
	
	if is_jump_interrupted:
		new_velocity.y=0.0
	
	return new_velocity



func toggle_small_popup()->void:
	get_node("small_popup").visible=!get_node("small_popup").visible
func toggle_text_popup()->void:
	get_node("text_popup").visible=!get_node("text_popup").visible
func change_text_popup_text(text:String):
	get_node("small_popup/Label").text=text

