extends Node2D

const ANGULAR_SPEED = 2.0  # Velocidad angular de rotación

func _process(delta):
	# Obtener la entrada del usuario para rotar el palo
	var rotation_input = 0
	if Input.is_action_pressed("ui_left"):
		rotation_input += 1
	if Input.is_action_pressed("ui_right"):
		rotation_input -= 1

	# Rotar el palo
	rotation += rotation_input * ANGULAR_SPEED * delta
