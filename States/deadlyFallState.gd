extends State
class_name  DeadlyFallState

func _enter():
	print("[ENTER]: deadly fall")

func _exit():
	print("[EXITED]: deadly fall")

func _update(_delta: float):
	if (Input.is_action_just_pressed("action_key") && player.isThrowing && player.boom):
		Transitioned.emit(self, "teleportingstate")

func _physics_update(_delta: float):
	if (player.is_on_floor()):
		Transitioned.emit(self, "squashstate")
