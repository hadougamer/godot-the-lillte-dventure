extends Node

var heroPos=null

func _ready():
	heroPos = $heroPos.global_position
	Global.loadCamera(self)

func _process(delta):
	if !Global.hero:
		Global.loadHero(self, heroPos)

