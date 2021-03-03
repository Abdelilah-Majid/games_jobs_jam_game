extends Node



var current_player:String="water" 
var what_player_is_in_water:=""
var robot_health=100.0
var lighting_braziers=0
var is_open_door_platforms_active=[]



func _physics_process(delta: float) -> void:
	if what_player_is_in_water=="robot":
		pass
	if robot_health<=0:
		pass
