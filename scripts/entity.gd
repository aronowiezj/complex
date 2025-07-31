extends CharacterBody2D
class_name Entity

@onready var default_collision_box = $DefaultCollision
@onready var crouch_collision_box = $CrouchCollision
@onready var default_sprite = $DefaultSprite
@onready var crouch_sprite = $CrouchSprite

@export var speed = 300.0
@export var jump_velocity = 400.0

var is_gravity_reversed = false
var is_gravity_shifted_right = false
var saved_incubator_index: int = -1

var skills: Array[Skill]

func switch_to_default_state() -> void:
	crouch_collision_box.disabled = true
	default_collision_box.disabled = false
	crouch_sprite.visible = false
	default_sprite.visible = true

func can_stand() -> bool:
	## TODO tester la hauteur du plafond au-dessus du joueur
	return true
