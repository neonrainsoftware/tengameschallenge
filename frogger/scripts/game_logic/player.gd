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
var animation_speed : int = 3
var is_moving : bool = false

@onready var ray: RayCast2D = $RayCast2D

func _ready() -> void:
	Signals.connect("on_hit", lose_life)
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size / 2

func _unhandled_input(event: InputEvent) -> void:
	if is_moving:
		return
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move_player(dir)

func move_player(dir: String) -> void:
	ray.target_position = inputs[dir] * tile_size
	ray.force_raycast_update()
	if !ray.is_colliding():
		var tween : Tween = create_tween()
		tween.tween_property(self, "position",
			position + inputs[dir] * tile_size, 1.0 / animation_speed).set_trans(Tween.TRANS_SINE)
		is_moving = true
		await tween.finished
		is_moving = false

func lose_life() -> void:
	if player_lives >= 1:
		player_lives -= 1
		if player_lives <= 0:
			Signals.emit_signal("on_lose")
