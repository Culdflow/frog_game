extends State
class_name IdleState

func _enter():
	print("[ENTER]: idle")

func _exit():
	print("[EXITED]: idle")

func _update(_delta: float):
	if (Input.is_action_pressed("action_key")):
		print(player.isThrowing, player.boom)
		if (player.is_on_floor() && !player.isThrowing):
			Transitioned.emit(self, "chargingstate")
	if (Input.is_action_just_pressed("action_key") && player.isThrowing && player.boom):
		Transitioned.emit(self, "teleportingstate")
	if (player.velocity.y > 10):
		Transitioned.emit(self, "fallstate")

func _physics_update(_delta: float):
	pass
