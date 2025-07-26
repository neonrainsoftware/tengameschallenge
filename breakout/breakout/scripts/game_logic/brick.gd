extends Node

enum BrickState {DEFAULT, LDAMAGE, HDAMAGE}
var currbrickstate : BrickState
@onready var color_brick : int = 3

func _ready() -> void:
    Signals.connect("on_brick_hit", change_brick_health)

    currbrickstate = BrickState.DEFAULT

func _process(delta: float) -> void:
    pass

func change_brick_health() -> void:
    Signals.emit_signal("on_score", 100)
    match currbrickstate:
        BrickState.DEFAULT: currbrickstate = BrickState.LDAMAGE
        BrickState.LDAMAGE: currbrickstate = BrickState.HDAMAGE
        BrickState.HDAMAGE: queue_free()
        _: queue_free()