extends AnimatableBody2D
class_name MovingObs

var speed : float = 50.0

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	velocity.x -= speed
