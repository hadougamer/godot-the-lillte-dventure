extends Node2D

var hello = "Hello world!"

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Global 2 loaded")
	print(hello)
