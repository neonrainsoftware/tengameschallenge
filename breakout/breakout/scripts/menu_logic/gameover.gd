extends Control

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_high_scores_pressed() -> void:
	hide()

func _on_retry_pressed() -> void:
	hide()
	# Globalvars.emit_signal("on_retry")