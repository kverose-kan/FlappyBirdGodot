extends Node2D
@onready var label = $Label
@onready var player = $Player



# Called when the node enters the scene tree for the first time.
func _ready():
	Events.pipePassed.connect(_update_Score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _update_Score():
	label.text = str(player.score) 

	

