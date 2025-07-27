extends CharacterBody2D

var player_lives : int = 3
var player_name : String
const SPEED : float = 1000.0

func _physics_process(delta: float) -> void:
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func move_player(pos : Vector2) -> void:
	$PlayerCharacter.position.x = pos.x