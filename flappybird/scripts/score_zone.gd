extends Area2D
class_name ScoreZone

func _on_body_entered(body:Node2D) -> void:
	if body.get_class() == "CharacterBody2D":
		queue_free()
		print("you scored a point")
		Globalvars.emit_signal("on_scoring")
