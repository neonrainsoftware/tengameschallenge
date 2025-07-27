extends Control

var ui_elements : Dictionary = {}
var player_lives : int
var score : int

func _ready() -> void:
	Signals.connect("on_score", increment_score)
	Signals.connect("on_ball_destroy", lose_life)

	player_lives = 3
	score = 0
	create_ui()

func create_ui() -> void:
	var lives_label : Label = Label.new()
	lives_label.text = str("Lives: ", player_lives)
	add_child(lives_label)
	ui_elements["lives"] = lives_label

	var score_label : Label = Label.new()
	score_label.text = str("Score: ", score)
	add_child(score_label)
	score_label.position.y += 20.0
	ui_elements["score"] = score_label

func increment_score() -> void:
	score += 100
	ui_elements["score"].text = str("Score: ", score)

func lose_life() -> void:
	if player_lives >= 0:
		player_lives -= 1
	ui_elements["lives"].text = str("Lives: ", player_lives)
