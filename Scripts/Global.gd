extends Node

var coins 		= 0
var hero 		= null
var camera 		= null
var level 		= null
var interface	= null
var head_popuping = false

var pre_hero 		= preload("res://Scenes/Hero.tscn")
var pre_camera 		= preload("res://Scenes/Camera.tscn")
var pre_interface 	= preload("res://Scenes/Interface.tscn")
var pre_headtext 	= preload("res://Scenes/HeadText.tscn")

var levels = [
	preload("res://Scenes/level-01-1.tscn"),
	preload("res://Scenes/level-01-2.tscn"),
	preload("res://Scenes/level-01-3.tscn")
]

func _ready():
	print("Global Loaded")

func loadLevel(context, num):
	# Delete loaded levels
	var levelLoaded = get_tree().get_nodes_in_group("level")
	if( levelLoaded.size() > 0 ):
		levelLoaded[0].queue_free()

	level = levels[num].instance()

	context.add_child( level )

func loadHero( context, position):
	hero = pre_hero.instance()
	hero.global_position = position
	context.add_child( hero )

func loadInterface( context, position):
	interface = pre_interface.instance()
	interface.global_position = position
	context.add_child( interface )

func loadCamera( context ):
	camera = pre_camera.instance()
	camera.current = true
	camera.limit_bottom=768
	camera.limit_left=0
	context.add_child( camera )

func loadHeadText( body, text ):
	var headText = pre_headtext.instance()
	#headText.position.x -= 20
	headText.position.y = (headText.position.y - 40)
	headText.text = text
	body.add_child(headText)

func loadItem(context, position, item_name):
	if item_name == 'ghost':
		var pre_item = preload("res://Scenes/Ghost.tscn")
		var item = pre_item.instance()
		item.position = position
		item.position.y = position.y-60
		context.add_child(item)

	if item_name == 'coin':
		var pre_item = preload("res://Scenes/Diamond.tscn")
		var item = pre_item.instance()
		item.position = position
		item.position.y = position.y-60
		context.add_child(item)

func _process(delta):
	if hero and camera:
		camera.global_position=hero.global_position
