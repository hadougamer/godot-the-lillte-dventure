extends Node

export(Script) var game_save_class

var heroPos=null

func _ready():
	heroPos = $heroPos.global_position
	Global.loadCamera(self)

func _process(delta):
	if !Global.hero:
		Global.loadHero(self, heroPos)
	
	if Input.is_action_just_pressed("ui_loadstate"):
		Global.loadHeadText( Global.hero, "State is loaded!" )
		self._load_state()

	if Input.is_action_just_pressed("ui_savestate"):
		Global.loadHeadText( Global.hero, "Save State!" )
		self._save_state()

func _on_AreaCP_body_entered(body):
	if body.is_in_group("Hero"):
		Global.loadHeadText( body, "Save State!" )
		self._save_state()

# Save State
func _save_state():
	var new_save = game_save_class.new()
	new_save.hero_position = Global.hero.global_position
	
	# Validade dir
	var dir = Directory.new()
	var dirpath = "res://saves"
	if not dir.dir_exists(dirpath):
		dir.make_dir_recursive(dirpath)

	ResourceSaver.save("res://saves/game_save.tres", new_save)

func _load_state():
	var dir = Directory.new()
	var filepath = "res://saves/game_save.tres"
	if not dir.file_exists(filepath):
		return false

	var save_state = load(filepath)
	if not _verify_save( save_state ):
		return false
	
	Global.hero.global_position = save_state.hero_position

	return true

func _verify_save( save_state ):
	if not save_state.hero_position:
		return false

	return true

