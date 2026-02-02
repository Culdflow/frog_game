extends State
class_name TeleportingState

@export var tp_speed = 100

func _enter():
	print("[ENTER]: teleporting")
	if (player.boom):  
		var tp_tween = get_tree().create_tween()
		tp_tween.finished.connect(_tween_finished)
		var distance = player.global_position.distance_to(player.boom.global_position)
		tp_tween.tween_property(player, "global_position", player.boom.global_position, (distance / tp_speed))
		player.boom.queue_free()
		player.boom = null

func _tween_finished():
	player.velocity.x = 0
	Transitioned.emit(self, "idlestate")
	player.isThrowing = false

func _exit():
	print("[EXITED]: teleporting")

func _update(_delta: float):
	player.rotation = 0

func _physics_update(_delta: float):
	pass
