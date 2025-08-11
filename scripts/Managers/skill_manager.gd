extends Node

enum Skill
{
	Jump,
	Crouch,
	Magnet,
	Planeshift,
	ReverseGravity,
	ShiftGravityToTheRight
}

func get_skill_name(_skill: Skill) -> String:
	match _skill:
		Skill.Jump: return "Jump"
		Skill.Crouch: return "Crouch"
		Skill.Magnet: return "Magnet"
		Skill.Planeshift: return "Planeshift"
		Skill.ReverseGravity: return "Reverse Gravity"
		Skill.ShiftGravityToTheRight: return "Shift Gravity To The Right"
	return ""

func process_skill(_skill: Skill, _entity: Entity, _delta: float) -> void:
	match _skill:
		Skill.Jump: process_jump(_entity, _delta)
		Skill.Crouch: process_crouch(_entity, _delta)
		Skill.Magnet: process_magnet(_entity, _delta)
		Skill.Planeshift: process_planeshift(_entity, _delta)
		Skill.ReverseGravity: process_reverse_gravity(_entity, _delta)
		Skill.ShiftGravityToTheRight: process_shift_gravity_right(_entity, _delta)

func process_jump(_entity: Entity, _delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
		if _entity.is_gravity_reversed:
			if _entity.is_on_ceiling():
				_entity.velocity.y = _entity.jump_velocity
		elif _entity.is_on_floor():
			_entity.velocity.y = -_entity.jump_velocity
			
var is_crouching: bool = false

func process_crouch(_entity: Entity, _delta: float) -> void:
	if Input.is_action_pressed("crouch") && _entity.is_on_floor():
		_entity.default_collision_box.disabled = true
		_entity.crouch_collision_box.disabled = false
		_entity.default_sprite.visible = false
		_entity.crouch_sprite.visible = true
		is_crouching = true
	elif is_crouching && _entity.can_stand():
		_entity.switch_to_default_state()

var is_targeting: bool = false

func process_magnet(_entity: Entity, _delta: float) -> void:
	if Input.is_action_just_pressed("magnet"):
		is_targeting = true
	elif is_targeting:
		is_targeting = false
		
var is_shift: bool = false

func process_planeshift(_entity: Entity, _delta: float) -> void:
	if Input.is_action_just_pressed("planeshift"):
		is_shift = true
	elif is_shift:
		is_shift = false
		
func process_reverse_gravity(_entity: Entity, _delta: float) -> void:
	if Input.is_action_just_pressed("reverse_gravity"):
		if _entity.is_gravity_reversed:
			_entity.is_gravity_reversed = false
			_entity.default_sprite.rotation = 0
		else:
			_entity.is_gravity_reversed = true
			_entity.default_sprite.rotation = PI
			
func process_shift_gravity_right(_entity: Entity, _delta: float) -> void:
	if Input.is_action_just_pressed("reverse_gravity"):
		_entity.rotation_degrees = -90
		_entity.velocity = Vector2.ZERO
	if Input.is_action_pressed("reverse_gravity"):
		_entity.is_gravity_shifted_right = true
	elif _entity.is_gravity_shifted_right:
		_entity.velocity = Vector2.ZERO
		_entity.rotation_degrees = 0
		_entity.is_gravity_shifted_right = false
