extends Node

enum BrickState {DEFAULT, LDAMAGE, HDAMAGE}
var damage_array : Array = [Color(0,255,0), Color(255,255,0), Color(255,0,0)]
var currbrickstate : BrickState
var brick_color : Node

func _ready() -> void:
    currbrickstate = BrickState.DEFAULT
    brick_color = get_node("BrickBody/BrickColor")
