extends Node2D

var speed = 75
var hidden = false

func _ready():
	print("Booo! Im a ghost!")

func _process(delta):
	if Global.hero:
		$Sprite.play("default");
		if self.position.x >= Global.hero.position.x:
			$Sprite.flip_h=true
			if !hero_saw_me():
				self.position.x -= speed * delta
		elif self.position.x < Global.hero.position.x:
			$Sprite.flip_h=false
			if !hero_saw_me():
				self.position.x += speed * delta
		if self.position.y >= Global.hero.position.y:
			if !hero_saw_me():
				self.position.y -= speed * delta
		elif self.position.y < Global.hero.position.y:
			if !hero_saw_me():
				self.position.y += speed * delta
				show_me()
			
		if hero_saw_me():
			hide_me()
			$Sprite.stop()

func show_me():
	# Alpha 100%
	self.hidden=false
	$Sprite.set_modulate(Color(1,1,1,1))

func hide_me():
	# Alpha 30%
	self.hidden=true
	$Sprite.set_modulate(Color(1,1,1,0.3))

func hero_saw_me():
	var hero_flip = Global.hero.get_node("Sprite").flip_h
	return $Sprite.flip_h != hero_flip


func _on_Area_body_entered(body):
	if body.is_in_group("Hero") and !hidden:
		body.die()
