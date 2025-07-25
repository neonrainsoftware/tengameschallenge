extends CanvasLayer

var ui_elements : Dictionary = {}

func _ready() -> void:
    create_ui()

func create_ui() -> void:
    var label : Label = Label.new()
    var score : int = 0
    label.text = str("Score: ", score)
    add_child(label)
    ui_elements["score"] = label