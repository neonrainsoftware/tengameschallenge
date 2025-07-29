extends CharacterBody2D

var player_lives : int = 3
var player_name : String
const SPEED : float = 500.0

func _ready() -> void:
	Signals.connect("on_detected", lose_life)

func _physics_process(_delta: float) -> void:
	var direction : Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if Input.is_action_pressed("ui_right") || Input.is_action_pressed("ui_left"):
		direction.y = 0
	elif Input.is_action_pressed("ui_up") || Input.is_action_pressed("ui_down"):
		direction.x = 0
	else: 
		direction = Vector2.ZERO

	direction = direction.normalized()
	velocity = (direction * SPEED)
	move_and_slide()

func move_player(pos : Vector2) -> void:
	$PlayerCharacter.position.x = pos.x

func lose_life() -> void:
	if player_lives >= 1:
		player_lives -= 1
		if player_lives <= 0:
			Signals.emit_signal("on_lose")
		else:
			Signals.emit_signal("on_hit")