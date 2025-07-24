extends CharacterBody2D
class_name Player

var jump_velocity : float = 400.0
const GRAVITY : float = 500.0
var temp_gravity : float = 0.0
var jump_timer : float = 0.5
var is_lose: bool = false

func _ready() -> void:
	position = Vector2(85.0, 302.0)

func _physics_process(delta: float) -> void:
	if not is_lose and not is_on_floor():
		while temp_gravity < GRAVITY:
			temp_gravity += 15.0
		velocity.y += temp_gravity * delta

		if jump_timer < 0.5:
			jump_timer += delta

		if Input.is_action_just_pressed("ui_accept") and jump_timer >= 0.5:
			if position.y >= -300.0: 
				velocity.y -= jump_velocity
				temp_gravity = 0.0
				jump_timer = 0.0
		var collider = move_and_collide(velocity * delta)
		if collider:
			var collision = collider.get_collider()
			if collision is Obstacles or collision is MovingObs:
				on_hit()
				is_lose = true
				velocity.y = 0

func on_hit():
	queue_free()
	Globalvars.emit_signal("on_lose")