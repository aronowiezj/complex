extends CanvasItem
class_name GameWindow

@export var is_active: bool

static func get_instance() -> GameWindow:
	return null
	
func reset() -> void:
	return
	
func show_window() -> void:
	show()
	
func hide_window() -> void:
	hide()

func set_active(_is_active: bool) -> void:
	is_active = _is_active
	if _is_active:
		call_deferred("_change_mode", Node.PROCESS_MODE_INHERIT)
		reset()
		show_window()
	else:
		call_deferred("_change_mode", Node.PROCESS_MODE_DISABLED)
		hide_window()

func _change_mode(mode: ProcessMode) -> void:
	process_mode = mode
