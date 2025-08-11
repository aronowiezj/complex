extends GameWindow
class_name GameBoard

static func get_instance() -> GameWindow:
	return preload("res://Scenes/GameWindows/game_board.tscn").instantiate()
	
func show_window() -> void:
	GAME.player.camera.enabled = true
	super.show_window()

func hide_window() -> void:
	GAME.player.camera.enabled = false
	super.hide_window()
