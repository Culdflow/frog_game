extends State
class_name FallState

func _enter():
	print("[ENTER]: fall")

func _exit():
	print("[EXITED]: fall")

func _update(_delta: float):
	if (Input.is_action_just_pressed("action_key") && player.isThrowing && player.boom):
		Transitioned.emit(self, "teleportingstate")

func _physics_update(_delta: float):
	if (player.velocity.y >= player.max_fall_speed):
		Transitioned.emit(self, "deadlyfallstate")
	if (player.is_on_floor()):
		Transitioned.emit(self, "idlestate")
