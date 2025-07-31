extends Skill

func process_skill(_entity: Entity, _delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
		if _entity.is_gravity_reversed:
			if _entity.is_on_ceiling():
				_entity.velocity.y = _entity.jump_velocity
		elif _entity.is_on_floor():
			_entity.velocity.y = -_entity.jump_velocity
			
		
