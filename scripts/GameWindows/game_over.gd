extends GameWindow
class_name GameOver

static func get_instance() -> GameWindow:
	return preload("res://Scenes/GameWindows/game_over.tscn").instantiate()
	
func _on_button_pressed():
	EVENTS.emit_signal("on_player_restart")
