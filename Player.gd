extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var anim = $AnimatedSprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	anim.play("Idling")
	add_to_group("player")
	


func _physics_process(delta):
	if not Globals.isDead:
		if not is_on_floor():
			velocity.y += gravity * delta


		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		var direction = Input.get_axis("ui_left", "ui_right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		move_and_slide()
		
	else:
		anim.play("Die")
		gravity = 0
		velocity.y = 0
		velocity.x = 0
		anim.animation_finished.connect(FinishPlaying)

func FinishPlaying():
	if Globals.currentAreaH == 0:
		position.x = 50
		position.y = 600
		print("Respawning at ", position.x)
	else:
		position.x = Globals.currentAreaH * 600
		position.y = 600
		print("Respawning at ", position.x)
	_ready()
	gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
	Globals.isDead = false
# This should be "same level (Chapter)", but that's a problem for future me

