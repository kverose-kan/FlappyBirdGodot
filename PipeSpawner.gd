extends Node2D

var newPipeScene = preload("res://pipes.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	Events.playerDead.connect(_on_player_death)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	var pipe = newPipeScene.instantiate()
	pipe.position.x = 160
	pipe.position.y = randi_range(72, 121)
	get_tree().current_scene.add_child(pipe)

func _on_player_death():
	queue_free()
