extends Interactable
class_name Skill

func process_skill(_entity: Entity, _delta: float) -> void:
	pass

func interact() -> void:
	GAME.new_skill(new())
	queue_free()
