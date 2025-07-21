extends Node

var packedObj = preload("res://scenes/movingobstacle.tscn")

func _ready() -> void:
    for i in 5:
        var obj = packedObj.instance()
        $Platforms.add_child(obj)
        obj.set_translation()