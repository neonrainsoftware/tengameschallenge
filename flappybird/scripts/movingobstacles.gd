extends AnimatableBody2D
class_name MovingObs

var is_scored : bool = false
var time_elapsed : float = 0.0

func _ready() -> void:
	$Animation.play("movement")

func _process(delta: float) -> void:
	time_elapsed += delta
	if time_elapsed >= 7.0:
		queue_free()
		Globalvars.emit_signal("on_destroy")
	
func _on_score_zone_body_entered(body:Node2D) -> void:
	if body.get_class() == "CharacterBody2D" and not is_scored:
		is_scored = true
		Globalvars.emit_signal("on_scoring")
