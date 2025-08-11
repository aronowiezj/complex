extends PanelContainer

@onready var skill_chip_container = $HBoxContainer/MarginContainer/SkillChipContainer

var chips: Dictionary # SkillChip: SKILLS.Skill

func _ready() -> void:
	for skill in SKILLS.Skill.values():
		var chip = SkillChip.get_instance()
		skill_chip_container.add_child(chip)
		chip.reskill(skill)
		chips[chip] = skill
	
func show_skill() -> void:
	visible = true
	for chip in chips.keys():
		if GAME.player.skills.has(chips[chip]):
			chip.update(GAME.player.skills[chips[chip]])
		else:
			chip.update(false)

func hide_skill() -> void:
	visible = false
