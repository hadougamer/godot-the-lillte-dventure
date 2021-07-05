extends Node2D


export var text=""
var count=0
var pop_on=true

# Called when the node enters the scene tree for the first time.
func _ready():
	if not Global.head_popuping:
		Global.head_popuping = true
		$Label.text=self.text
		$Anim.play("popup")

func _process(delta):
	if pop_on and count < 22:
		self.position.y -= 115 * delta
		count+=1

func _on_Anim_animation_finished(animation):
	Global.head_popuping = false
	self.queue_free()
