extends CharacterBody2D

const JUMP_VELOCITY = -400.0

func _ready() -> void:
	pass

func movement(delta: float) -> void:
		# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

func _physics_process(delta: float) -> void:
	movement(delta)
	move_and_slide()
