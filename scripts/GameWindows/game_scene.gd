extends Node
class_name GameScene

@onready var scenes_node = $Scenes
@onready var timer = $Timer

var game_board: GameWindow
var game_over: GameWindow

var scenes: Array

func _ready():
	EVENTS.on_player_lost.connect(on_player_lost_event)
	EVENTS.on_player_restart.connect(on_player_restart_event)
	
	GAME.game_scene = self
	
	game_over = GameOver.get_instance()
	_add_scene(game_over)
	game_board = GameBoard.get_instance()
	_add_scene(game_board)
	
	# TEMP
	_open_alone(game_board)
	
func _add_scene(_scene: GameWindow) -> void:
	scenes.append(_scene)
	scenes_node.add_child(_scene)
	
func _unactive_all_scenes() -> void:
	for _scene in scenes:
		_scene.set_active(false)
	
func _open_alone(_window: GameWindow) -> void:
	_unactive_all_scenes()
	_window.set_active(true)
	
#### SIGNALS ####
	
func on_player_lost_event() -> void:
	#_open_alone(game_over)
	GAME.player.die()

func on_player_restart_event() -> void:
	#_open_alone(box_selection)
	GAME.reset()
