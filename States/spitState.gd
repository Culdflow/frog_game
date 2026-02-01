extends State
class_name SpitState

var boomerang = preload("res://Objects/boomerang.tscn")
var norm_vec_boom: Vector2 = Vector2.ZERO

func _enter():
	print("[ENTER]: spit")
	player.isThrowing = true
	player.spitAngle.look_at(get_viewport().get_mouse_position())
	var boomerang_instance = boomerang.instantiate()
	norm_vec_boom = Vector2.from_angle(player.get_angle_to(get_viewport().get_mouse_position()))
	player.get_parent().add_child(boomerang_instance)
	boomerang_instance._start(norm_vec_boom, player.chargeAmount * 10, player, player.global_position)
	Transitioned.emit(self, "idlestate")

func _exit():
	player.chargeAmount = 0
	print("[EXITED]: spit")

func _update(_delta: float):
	pass

func _physics_update(_delta: float):
	pass
