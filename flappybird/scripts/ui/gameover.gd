extends Node2D


func _on_retry_button_pressed() -> void:
    hide()
    Globalvars.emit_signal("on_retry")

func _on_quit_button_pressed() -> void:
    get_tree().quit()
