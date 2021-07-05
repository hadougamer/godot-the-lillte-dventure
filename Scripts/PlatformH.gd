extends KinematicBody2D

export(String, "right", "left") var direction="right"
export var speed = 100

func _physics_process(delta):
	if self.direction == "right":
		self.position.x += speed * delta
	elif self.direction == "left":
		self.position.x -= speed * delta


func _on_Area_body_entered(body):
	if body.is_in_group("stage"):
		if self.direction == "right":
			self.direction = "left"
		else:
			self.direction = "right"
