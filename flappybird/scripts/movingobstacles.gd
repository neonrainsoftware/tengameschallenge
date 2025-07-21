extends AnimatableBody2D
class_name MovingObs

func _ready() -> void:
	$Animation.play("movement")

func _process(delta: float) -> void:
	pass
