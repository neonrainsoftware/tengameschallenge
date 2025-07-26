extends CanvasLayer

var ui_elements : Dictionary = {}
var player_lives : int
var score : int

func _ready() -> void:
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
    ui_elements["score"] = score_label
