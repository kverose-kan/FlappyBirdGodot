extends StaticBody2D
@onready var animation_player = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	Events.playerDead.connect(_on_player_death)

func _on_player_death():
	animation_player.stop()

