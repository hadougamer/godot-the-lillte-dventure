extends Node2D

export(String, "ghost", "coin") var item = "ghost"

var open=false
var on_chest=false

func _process(delta):
	if (on_chest and !open) and Input.is_action_just_pressed("ui_up"):
		$Sprite.play("opening")

func _on_Area_body_entered(body):
	if body.is_in_group("Hero"):
		self.on_chest=true

func _on_Area_body_exited(body):
	if body.is_in_group("Hero"):
		self.on_chest=false

func _on_Sprite_animation_finished():
	if $Sprite.get_animation() == "opening":
		Global.loadItem(Global.level, self.global_position, item)
		open = true