extends Node2D

func _ready():
	pass 
	

func _on_Soundtrack__body_entered(body):
	MusicController.play_lvl1_music()
	
