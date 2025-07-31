extends Interactable
class_name IncubatorTank

var isEmpty: bool:
	get: return incubatorSave == null
var incubatorSave: EntitySave

var lastEntity: Entity

func _ready() -> void:
	GAME.incubators.append(self)
		
func interact() -> void:
	save(lastEntity)
		
func save(_entity: Entity) -> void:
	incubatorSave = EntitySave.create(_entity)
	_entity.savedIncubatorIndex = GAME.incubators.find(self, 0)

func handle_collision(_body: Node2D) ->  void:
	lastEntity = _body
