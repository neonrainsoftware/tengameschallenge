extends Area2D

var player_lives : int = 3
var player_name : String
var tile_size : int = 64
var inputs : Dictionary = {
	"ui_right": Vector2.RIGHT,
	"ui_left": Vector2.LEFT,
	"ui_up": Vector2.UP,
	"ui_down": Vector2.DOWN
}

@onready var ray: RayCast2D = $RayCast2D
# const SPEED : float = 500.0


func _ready() -> void:
	Signals.connect("on_hit", lose_life)
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size / 2

func _unhandled_input(event: InputEvent) -> void:
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move_player(dir)

func move_player(dir: String) -> void:
	ray.target_position = inputs[dir] * tile_size
	ray.force_raycast_update()
	if !ray.is_colliding():
		position += inputs[dir] * tile_size

# func _physics_process(_delta: float) -> void:
# 	var direction : Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
# 	if Input.is_action_pressed("ui_right") || Input.is_action_pressed("ui_left"):
# 		direction.y = 0
# 	elif Input.is_action_pressed("ui_up") || Input.is_action_pressed("ui_down"):
# 		direction.x = 0
# 	else: 
# 		direction = Vector2.ZERO

# 	direction = direction.normalized()
# 	velocity = (direction * SPEED)
# 	move_and_slide()

# func move_player(pos : Vector2) -> void:
# 	$PlayerCharacter.position.x = pos.x

func lose_life() -> void:
	if player_lives >= 1:
		player_lives -= 1
		if player_lives <= 0:
			Signals.emit_signal("on_lose")
