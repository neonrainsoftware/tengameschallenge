extends CharacterBody2D

enum BallState {STATIONARY, MOVING}
var currballstate : BallState
const BALL_VELOCITY : Vector2 = Vector2(100.0, 100.0)
var speed : int = 200

func _ready() -> void:
	Signals.connect("on_timer_end", change_ball_state)

	currballstate = BallState.STATIONARY
	velocity = Vector2(speed * -1, speed)

func _physics_process(delta: float) -> void:
	if currballstate == BallState.MOVING:
		var collision = move_and_collide(velocity * delta)
		if collision:
			var collider = collision.get_collider()
			velocity = velocity.bounce(collision.get_normal())
			if collider.is_in_group("Bricks"):
				var brick_to_break = Signals.bricks_in_level[collider.get_instance_id()]
				Signals.bricks_in_level.erase(collider.get_instance_id())
				break_brick(brick_to_break)
			if collider.is_in_group("DangerZone"):
				Signals.emit_signal("on_ball_destroy")
				queue_free()
		if velocity.y > 0 and velocity.y < 100:
			velocity.y = -200
		if velocity.x == 0:
			velocity.x = -200

func change_ball_state() -> void:
	if currballstate == BallState.STATIONARY:
		currballstate = BallState.MOVING
		
func break_brick(brick : Node) -> void:
	Signals.emit_signal("on_score")
	brick.queue_free()
	
func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	print("test")
