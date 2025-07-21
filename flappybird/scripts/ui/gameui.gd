extends CanvasLayer

var ui_elements : Dictionary = {}

func _ready() -> void:
    create_ui()

func create_ui() -> void:
    var label : Label = Label.new()
    label.text = "Score: 0"
    add_child(label)
    ui_elements["score"] = label