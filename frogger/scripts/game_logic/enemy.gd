class_name Enemy
extends Node

var vision_cone

func _ready() -> void:
	vision_cone = $VisionCone

func _process(delta: float) -> void:
	pass