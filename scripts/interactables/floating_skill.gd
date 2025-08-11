extends Interactable

@export var skill: SKILLS.Skill

func interact() -> void:
	GAME.player.update_skill(skill, true)
	queue_free()
