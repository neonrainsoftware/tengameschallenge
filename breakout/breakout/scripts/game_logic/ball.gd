extends Node

func _ready() -> void:
    Signals.connect("on_ball_death", destroy_ball)

func _process(delta: float) -> void:
    # TODO: ON HIT BRICK
    Signals.emit_signal("on_brick_hit")

func destroy_ball() -> void:
    queue_free()