extends Area2D
class_name Interactable

var canInteract: bool

@onready var interaction_label = %InteractionLabel

func _process(_delta) -> void:
	if Input.is_action_just_pressed("interact") && canInteract:
		interact()

func _on_body_entered(_body: Node2D) -> void:
	if _body is Player:
		canInteract = true
		interaction_label.visible = true
		handle_collision(_body)

func _on_body_exited(_body: Node2D) -> void:
	if _body is Player:
		canInteract = false
		interaction_label.visible = false

func handle_collision(_body: Node2D) -> void:
	pass
	
func interact() -> void:
	pass
