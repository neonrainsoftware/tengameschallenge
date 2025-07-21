extends Node

var packedObj = preload("res://scenes/movingobstacle.tscn")
var score : int = 0
var ui_manager

func _ready() -> void:
	# global signals
	Globalvars.connect("on_scoring", add_score)
	Globalvars.connect("on_lose", game_over)
	
	# loading UI
	ui_manager = load("res://scripts/ui/gameui.gd").new()
	add_child(ui_manager)

	# loading obstacles
	for i in 5:
		var obj = packedObj.instantiate()
		$Platforms.add_child(obj)
		# obj.set_translation()

func add_score() -> void:
	score += 1

func game_over() -> void:
	pass