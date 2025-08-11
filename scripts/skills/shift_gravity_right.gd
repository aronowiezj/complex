
func process_skill(_entity: Entity, _delta: float) -> void:
	if Input.is_action_just_pressed("reverse_gravity"):
		_entity.rotation_degrees = -90
		_entity.velocity = Vector2.ZERO
	if Input.is_action_pressed("reverse_gravity"):
		_entity.is_gravity_shifted_right = true
	elif _entity.is_gravity_shifted_right:
		_entity.velocity = Vector2.ZERO
		_entity.rotation_degrees = 0
		_entity.is_gravity_shifted_right = false
