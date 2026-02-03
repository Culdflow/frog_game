extends State
class_name SquashState

@export var squash_time:float = 2.0

func _enter():
	print("[ENTER]: squash")
	get_tree().create_timer(squash_time).timeout.connect(timer_finished)

func timer_finished():
	Transitioned.emit(self, "idlestate")

func _exit():
	print("[EXITED]: squash")

func _update(_delta: float):
	pass

func _physics_update(_delta: float):
	pass
