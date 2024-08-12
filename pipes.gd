extends Node2D
@onready var visible_on_screen_notifier_2d = $VisibleOnScreenNotifier2D

# Called when the node enters the scene tree for the first time.
func _ready():
	Events.playerDead.connect(_on_player_death)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_local_x(-0.8)

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_player_death():
	pass
