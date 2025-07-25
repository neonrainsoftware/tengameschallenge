extends Node

func _ready() -> void:
    Signals.connect("on_victory", victory_screen)
    pass

func _process(delta: float) -> void:
    pass

func victory_screen() -> void:
    pass