extends PanelContainer
class_name SkillChip

@onready var name_label = $MarginContainer/HBoxContainer/Label
@onready var check_button = $MarginContainer/HBoxContainer/CheckButton

var skill: SKILLS.Skill

static func get_instance() -> SkillChip:
	var chip = preload("res://Scenes/GameMenus/skill_chip.tscn").instantiate()
	return chip

func reskill(_skill: SKILLS.Skill) -> void:
	skill = _skill
	name_label.text = SKILLS.get_skill_name(skill)

func update(active: bool) -> void:
	check_button.button_pressed = active

func _on_check_button_toggled(toggled_on):
	GAME.player.update_skill(skill, toggled_on)
