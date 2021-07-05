extends Sprite

var collider=false

export var is_visible=true
export var anim_time=1000

var count=0

func _ready():
	collider = $Body.get_node("Collider")
	if is_visible:
		$Anim.play("is_visible")
		collider.disabled=false
	
	if !is_visible:
		$Anim.play("is_invisible")
		collider.disabled=true

func  _process(delta):
	if count == anim_time:
		if is_visible:
			$Anim.play("go_invisible")
		elif !is_visible:
			$Anim.play("go_visible")
		count=0
	else:
		count += 5

func _on_Anim_animation_finished(animation):
	if animation == "go_visible":
		collider.disabled=false
		is_visible=true

	if animation == "go_invisible":
		collider.disabled=true
		is_visible=false
