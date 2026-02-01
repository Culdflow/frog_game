extends State
class_name IdleState

func _enter():
	print("[ENTER]: idle")

func _exit():
	print("[EXITED]: idle")

func _update(_delta: float):
	if (Input.is_action_just_pressed("action_key") && player.is_on_floor() && !player.isThrowing):
		Transitioned.emit(self, "chargingstate")

func _physics_update(_delta: float):
	pass
