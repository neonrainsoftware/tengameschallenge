extends Control

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_high_scores_pressed() -> void:
	pass # Replace with function body.

func _on_retry_pressed() -> void:
	hide()
	# Globalvars.emit_signal("on_retry")