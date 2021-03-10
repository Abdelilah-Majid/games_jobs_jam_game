extends Node2D

func _ready():
	pass 

func _on_Soundtrack_lvl2_body_entered(body):
	MusicController.play_lvl2_music()
	
