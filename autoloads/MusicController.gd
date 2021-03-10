extends Node

var lvl1_music = load("res://assets/audio/Soundtrack/Track_1.ogg")
var lvl2_music = load("res://assets/audio/Soundtrack/Track_2.ogg")
var lvl4_music = load("res://assets/audio/Soundtrack/Track_3.ogg")
var game_over = load("res://assets/audio/Soundtrack/Game_Over.ogg")
var main_menu = load("res://assets/audio/Soundtrack/Main_Menu.ogg")

func _ready():
	pass

func play_lvl1_music():
	$Music.stream = lvl1_music
	$Music.play()

func play_lvl2_music():
	$Music.stream = lvl2_music
	$Music.play()

func play_lvl4_music():
	$Music.stream = lvl4_music
	$Music.play()

func play_game_over():
	$Music.stream = game_over
	$Music.play()

func play_main_menu():
	$Music.stream = main_menu
	$Music.play()

func turn_down_volume():
	$Music.volume_db = -80

func reset_volume():
	$Music.volume_db = 0

