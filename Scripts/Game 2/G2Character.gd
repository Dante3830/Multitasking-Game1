extends CharacterBody2D

const SPEED = 300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Reference to the AnimatedSprite2D node
var animated_sprite: AnimatedSprite2D

func _ready():
	# Get a reference to the AnimatedSprite2D node
	animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	$AnimatedSprite2D.play("idle")
	# Get the input direction and handle the movement/deceleration.
	# Use A and D keys for movement.
	var direction = 0
	if Input.is_key_pressed(KEY_A):
		direction -= 1
		$AnimatedSprite2D.play("walk")
		# Flip the sprite horizontally
		animated_sprite.flip_h = true
	if Input.is_key_pressed(KEY_D):
		direction += 1
		$AnimatedSprite2D.play("walk")
		# Set the sprite back to normal (not flipped)
		animated_sprite.flip_h = false
	
	if direction != 0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()
