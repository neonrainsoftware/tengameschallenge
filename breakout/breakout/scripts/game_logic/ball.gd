extends Node

enum BallState {STATIONARY, MOVING}
var currballstate : BallState

func _ready() -> void:
    Signals.connect("on_ball_death", destroy_ball)
    Signals.connect("on_timer_end", change_ball_state)

    currballstate = BallState.STATIONARY

func _process(delta: float) -> void:
    if currballstate == BallState.MOVING:
        # TODO: ON HIT BRICK
        Signals.emit_signal("on_brick_hit")

func destroy_ball() -> void:
    queue_free()

func change_ball_state() -> void:
    if currballstate == BallState.STATIONARY:
        currballstate = BallState.MOVING