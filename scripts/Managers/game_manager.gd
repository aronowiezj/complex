extends Node

const maxInt = 9223372036854775807 # max int value
const minInt = -9223372036854775808 # min int value

var current_floor: int = 0

var timer: Timer
var game_scene: GameScene
var player: Player
var incubators: Array[IncubatorTank]
var lastIncubator: IncubatorTank

#### LOGIC ####

func _ready() -> void:
	pass
	
func reset() -> void:
	pass
	
func wait_to(_seconds: float, _callable: Callable) -> void:
	game_scene.timer.wait_time = _seconds
	game_scene.timer.start()
	game_scene.timer.timeout.connect(_callable, ConnectFlags.CONNECT_ONE_SHOT)
