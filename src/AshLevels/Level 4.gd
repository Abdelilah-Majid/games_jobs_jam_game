extends Node2D

func _ready():
	pass # Replace with function body.


func _on_Soundtrack_lvl4_body_entered(body):
	MusicController.play_lvl4_music()
	
