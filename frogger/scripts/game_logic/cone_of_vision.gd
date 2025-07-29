extends Node

var vision_points : Array[Vector2]
var last_pos = null
var last_redraw_time : int = 0

func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	if self.visible:
		if check_for_player():
			Signals.emit_signal("on_detected")


func check_for_player() -> bool:
	return true