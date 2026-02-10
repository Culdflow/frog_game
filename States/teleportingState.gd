extends State
class_name TeleportingState

@export var tp_speed = 100
@export var line: Line2D
var kept_vel = Vector2(0, 0)
var last_tp_tweem
var tp_tween
var last_gravity_addr

func _enter():
	print("[ENTER]: teleporting")
	line.visible = true
	last_gravity_addr = player.gravity_speed_addr
	player.gravity_speed_addr = 0
	player.motion_mode = CharacterBody2D.MOTION_MODE_FLOATING
	player.collision_layer = 0
	player.collision_mask = 0
	if (player.boom):  
		kept_vel = player.boom.velocity
		var bouncle_list = player.boom.bounce_list
		var last_tp = player.boom.global_position
		player.boom.queue_free()
		for pos in bouncle_list:
			tp_tween = get_tree().create_tween()
			var distance = player.global_position.distance_to(pos)
			tp_tween.tween_property(player, "global_position", pos, (distance / tp_speed))
			await tp_tween.finished
		last_tp_tweem = get_tree().create_tween()
		last_tp_tweem.finished.connect(_tween_finished)
		var distance = player.global_position.distance_to(last_tp)
		last_tp_tweem.tween_property(player, "global_position", last_tp, (distance / tp_speed))
		
		
		player.boom = null

func _tween_finished():
	player.velocity = kept_vel
	Transitioned.emit(self, "idlestate")
	player.isThrowing = false

func _exit():
	print("[EXITED]: teleporting")
	player.motion_mode = CharacterBody2D.MOTION_MODE_GROUNDED
	player.gravity_speed_addr = last_gravity_addr
	player.collision_layer = 1
	player.collision_mask = 2
	line.visible = false

func _update(_delta: float):
	player.rotation = 0

func _physics_update(_delta: float):
	pass
