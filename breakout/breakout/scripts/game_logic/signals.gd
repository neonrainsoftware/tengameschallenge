extends Node

signal on_victory
signal on_defeat
signal on_ball_destroy
signal on_score
signal on_brick_hit(brick)
signal on_timer_end

var bricks_in_level : Dictionary