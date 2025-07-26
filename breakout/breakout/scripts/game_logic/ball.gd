extends Node2D

enum BallState {STATIONARY, MOVING}
var currballstate : BallState
const BALL_VELOCITY : Vector2 = Vector2(100.0, 100.0)
var curr_velocity : Vector2 = Vector2.ZERO

func _ready() -> void:
	Signals.connect("on_timer_end", change_ball_state)

	currballstate = BallState.MOVING
	curr_velocity = Vector2(200.0, 200.0)

func _physics_process(delta: float) -> void:
	if currballstate == BallState.MOVING:
		var collision = $Ball.move_and_collide(curr_velocity * delta)
		if collision:
			var reflect = collision.get_remainder().bounce(collision.get_normal())
			curr_velocity = curr_velocity.bounce(collision.get_normal())
			$Ball.move_and_collide(reflect)
		# TODO: ON HIT BRICK
		Signals.emit_signal("on_brick_hit")

func change_ball_state() -> void:
	if currballstate == BallState.STATIONARY:
		currballstate = BallState.MOVING

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
