extends Node
class_name VisionCone2D

@onready var angle : float = deg_to_rad(360.0)

var vision_points : Array[Vector2]
var last_pos = null
var last_redraw_time : int = 0

func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	if self.visible:
		if check_for_player():
			Signals.emit_signal("on_detected")

func calculate_vision_shape() -> Array[Vector2]:
	var new_vision_points : Array[Vector2] = []

	
	return vision_points

func check_for_player() -> bool:
	return true