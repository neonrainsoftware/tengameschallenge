extends Control

var timer_node
var timer
var cooldown : float = 1.0
var cooldown_flag : bool = false

func _ready() -> void:
	timer_node = get_node("MarginContainer/TimerLabel")
	timer = get_node("Countdown")
	timer.start()

func _on_countdown_timeout() -> void:
	timer_node.text = "Start!"
	cooldown_flag = true

func _process(delta: float) -> void:
	if cooldown_flag:
		cooldown -= delta
		if cooldown <= 0:
			hide()
			cooldown = 1.0
			cooldown_flag = false
