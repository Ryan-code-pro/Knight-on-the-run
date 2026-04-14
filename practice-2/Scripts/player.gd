extends CharacterBody2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


const SPEED = 200
const JUMP_VELOCITY = -400 


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		animated_sprite.play("Jump")
		velocity += get_gravity() * delta
	elif is_on_floor() and not(Input.get_axis("ui_left", "ui_right")):
		animated_sprite.play("Idle")
	else:
		animated_sprite.play("Running")

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if direction>0:
		animated_sprite.flip_h = false
	elif direction<0:
		animated_sprite.flip_h = true

	move_and_slide()
