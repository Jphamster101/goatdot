extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	print("delta: %s", delta)
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("z_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	
	# ------------------------------------------------------
	#if Input.is_key_pressed(KEY_SHIFT):
		#print("Shift key pressed!")
		#velocity.x = direction * (SPEED * 5.0)
	#print(velocity.x)
	#print(direction)
	# ------------------------------------------------------
	
	if direction:
		if Input.is_key_pressed(KEY_SHIFT):
			print("Shift key pressed!")
			velocity.x = direction * (SPEED * 5.0)
		#print(velocity.x)
		else:
			# -------------------------------------
			if Input.is_key_pressed(KEY_LEFT):
				$AnimatedSprite2D.flip_h = true
			else:
				$AnimatedSprite2D.flip_h = false
			#print("with direction:", velocity.x)
			# -------------------------------------
			velocity.x = direction * SPEED
	else:
		#print("no direction:", velocity.x)
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
