extends AnimatableBody2D
class_name MovingObs

func _ready() -> void:
	$Animation.play("movement")

func _on_animation_animation_finished(_anim_name:StringName) -> void:
	queue_free()

func _on_score_zone_body_entered(body:Node2D) -> void:
	if body.get_class() == "CharacterBody2D":
		queue_free()
		print("you scored a point")
		Globalvars.emit_signal("on_scoring")
