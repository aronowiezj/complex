
func process_skill(_entity: Entity, _delta: float) -> void:
	if Input.is_action_just_pressed("reverse_gravity"):
		if _entity.is_gravity_reversed:
			_entity.is_gravity_reversed = false
			_entity.default_sprite.rotation = 0
		else:
			_entity.is_gravity_reversed = true
			_entity.default_sprite.rotation = PI
