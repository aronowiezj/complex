	
var is_shift: bool = false

func process_skill(_entity: Entity, _delta: float) -> void:
	if Input.is_action_just_pressed("planeshift"):
		is_shift = true
	elif is_shift:
		is_shift = false
