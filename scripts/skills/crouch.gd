var is_crouching: bool = false

func process_skill(_entity: Entity, _delta: float) -> void:
	if Input.is_action_pressed("crouch") && _entity.is_on_floor():
		_entity.default_collision_box.disabled = true
		_entity.crouch_collision_box.disabled = false
		_entity.default_sprite.visible = false
		_entity.crouch_sprite.visible = true
		is_crouching = true
	elif is_crouching && _entity.can_stand():
		_entity.switch_to_default_state()
