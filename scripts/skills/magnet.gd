
var is_targeting: bool = false

func process_skill(_entity: Entity, _delta: float) -> void:
	if Input.is_action_just_pressed("magnet"):
		is_targeting = true
	elif is_targeting:
		is_targeting = false
