extends RigidBody2D

const FORCE = Vector2(0, -50)  # Fuerza aplicada en dirección vertical

func _ready():
	# Aplicar una fuerza al cuerpo rígido en cada cuadro
	set_process(true)

func _process(delta):
	# Aplicar la fuerza en cada cuadro para evitar que la esfera se quede quieta
	apply_central_impulse(FORCE * delta)
