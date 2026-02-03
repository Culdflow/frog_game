extends State
class_name SpitState

var boomerang = preload("res://Objects/boomerang.tscn")
var norm_vec_boom: Vector2 = Vector2.ZERO
@export var dist_multiplier := 10
@export var statemachine: StateMachine

func _ready() -> void:
	statemachine.animPlayer.animation_finished.connect(anim_fin)           

func _enter():
	print("[ENTER]: spit")
	player.isThrowing = true
	player.spitAngle.look_at(player.get_global_mouse_position())
	var boomerang_instance = boomerang.instantiate()
	var mouse_pos := player.get_global_mouse_position()
	norm_vec_boom = (mouse_pos - player.global_position).normalized()
	player.get_parent().add_child(boomerang_instance)
	player.boom = boomerang_instance
	print(player.boom)
	boomerang_instance._start(norm_vec_boom, player.chargeAmount * dist_multiplier, player, player.global_position)

func anim_fin(anim):
	Transitioned.emit(self, "idlestate")

func _exit():
	player.chargeAmount = 0
	print("[EXITED]: spit")

func _update(_delta: float):
	pass

func _physics_update(_delta: float):
	pass
