extends Node

func _ready() -> void:
	Signals.connect("on_lose", lose_game)

func lose_game() -> void:
	get_tree().hide()