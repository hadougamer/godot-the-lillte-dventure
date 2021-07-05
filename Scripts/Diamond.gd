extends AnimatedSprite

export var value = 100

func _on_DiamondArea_body_entered(body):
	if body.is_in_group("Hero"):
		Global.coins += self.value
		Global.loadHeadText( body, String(self.value) )
		print("My Coins: " + String( Global.coins) )
		queue_free()
