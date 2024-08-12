extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var animation_player = $AnimatedSprite2D/AnimationPlayer
@onready var flap_sound = $FlapSound

var GameOverScreen = preload("res://game_over.tscn")

const JUMP_VELOCITY = -100
var score = 0
var high_score = 0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 300

var inputDisabled = false
var DeathSoundPlayed = false


func _ready():
	Events.playerDead.connect(on_death)

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
	

	if Input.is_action_just_pressed("ui_accept") and inputDisabled == false:
		velocity.y = JUMP_VELOCITY
		
		flap_sound.play()
		
		
		# animation_player.play("fall")
		
	move_and_slide()
	_update_animations()
	

func _on_hurtbox_area_entered(area):
	if area.is_in_group("Hurtbox"):
		Events.playerDead.emit()
	else:
		score += 1
		Events.pipePassed.emit()
		$PointSound.play()

func on_death():
	inputDisabled = true
	if DeathSoundPlayed == false:
		$HitSound.play()
		
		high_score = max(score, Events.score)
		Events.score = high_score
		# oof sound if hit by pipe
		var game_over = GameOverScreen.instantiate()
		game_over.playerScore = score
		add_child(game_over)
		
		DeathSoundPlayed = true
		
	
	

func _update_animations():
	if velocity.y < 0:
		animation_player.play("flap")
	else:
		await get_tree().create_timer(.1).timeout
		animation_player.play("fall")
		

