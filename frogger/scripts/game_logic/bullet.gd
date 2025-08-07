extends AnimatableBody2D
class_name Bullet

var is_scored : bool = false
var time_elapsed : float = 0.0

@export var speed : float = 0.0

func _ready() -> void:
	$Animation.play("movement")

func _process(delta: float) -> void:
	time_elapsed += delta
	if time_elapsed - speed == abs(7.0):
		queue_free()
		Globals.emit_signal("on_destroy")

