extends KinematicBody2D

const UP = Vector2(0,-1)
const GRAVITY = 10
var motion = Vector2()

export(int, 0, 1) var random = 0

var fall = false # Need to fall

func _physics_process(delta):
	if fall:
		motion.y += GRAVITY
		motion.x = 0
		motion = move_and_slide(motion, UP)

	var slide_count = get_slide_count()
	if slide_count:
		var collision = get_slide_collision(slide_count - 1)
		var collider = collision.collider
		
		if fall == true:
			if collider.is_in_group("Hero"):
				queue_free()
				collider.die()
			if is_on_floor():
				queue_free()

func _on_DangerArea_body_entered(body):
	if body.is_in_group("Hero"):
		if random == 0:
			self.fall=true
		else:
			if randi()%10 > 5:
				self.fall=true
