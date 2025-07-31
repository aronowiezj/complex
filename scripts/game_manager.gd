extends Node

var player: Player
var incubators: Array[IncubatorTank]
var lastIncubator: IncubatorTank

func new_skill(skill: Skill) -> void:
	player.skills.append(skill)
