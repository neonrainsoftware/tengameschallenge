extends Node2D

func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_scores_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/ui_scenes/scoresdisplay.tscn")

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game_scenes/game.tscn")
