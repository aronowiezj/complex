extends Entity
class_name Player

var will_reset: bool

func _ready() -> void:
	GAME.player = self

func _physics_process(_delta: float) -> void:
	if will_reset:
		reset()
		return
	
	# Add the gravity.
	_apply_gravity(_delta)
		
	# Handle Skills
	for skill in skills:
		skill.process_skill(self, _delta)

	# Get the input direction and handle the movement/deceleration.
	_handle_inputs()
	move_and_slide()
	
func _handle_inputs() -> void:
	var direction = Input.get_axis("move_left", "move_right")
	if is_gravity_shifted_right:
		if direction:
			velocity.y -= direction * speed * .1 ### TODO wat?
		else:
			velocity.y -= move_toward(velocity.y, 0, speed)
	else:
		if direction:
			velocity.x = direction * speed
		else:
			velocity.x = move_toward(velocity.x, 0, speed)

func _apply_gravity(_delta: float) -> void:
	if is_gravity_reversed:
		if !is_on_ceiling():
			velocity -= get_gravity() * _delta
	elif is_gravity_shifted_right:
		if !is_on_wall(): ## TODO check wall position with the player
			velocity.x += get_gravity().y * _delta
	else:
		if !is_on_floor():
			velocity += get_gravity() * _delta

func die() -> void:
	will_reset = true

func teleport_to(_position: Vector2) -> void:
	velocity = Vector2.ZERO
	global_position = _position

func reset() -> void:
	if saved_incubator_index == -1:
		get_tree().reload_current_scene()
	else:
		teleport_to(GAME.incubators[saved_incubator_index].global_position)
	will_reset = false
