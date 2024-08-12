extends CanvasLayer
@onready var animation_player = $ScoreBoard/AnimationPlayer
@onready var score = $Score
@onready var best = $Best

var playerScore
var playerHighScore

# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player.play("Rise")
	score.hide()
	best.hide()
	score.text = str(playerScore) 
	best.text = str(Events.score)
	await get_tree().create_timer(0.5).timeout
	score.show()
	best.show()



func _on_texture_button_2_pressed():
	get_tree().reload_current_scene()


func _on_texture_button_pressed():
	get_tree().quit()
