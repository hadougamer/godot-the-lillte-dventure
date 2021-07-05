extends AnimatedSprite

var on_door=false
var open=false
export var target="exit"

func _process(delta):
	if open and self.get_animation() != "opened":
		self.play("oppened")
	elif !open and self.get_animation() != "closed":
		self.play("closed")


	if on_door and Input.is_action_just_pressed("ui_up"):
		print("Enter de Door")
		open=true
		var target_door=get_parent().get_node(self.target)
		if target_door:
			print("Got Targe Door")
			on_door=false
			Global.hero.position=target_door.position
	

func _on_Area_body_entered(body):
	# Hero is in the door
	if body.is_in_group("Hero"):
		self.on_door=true

func _on_Area_body_exited(body):
	# Hero is out the door
	if body.is_in_group("Hero"):
		self.on_door=false
