extends State
class_name ChargeReadyState

@export var charge_amount_per_second: int = 30
@export var max_charge_amount: int = 100
@export var statemachine: StateMachine
var tween = null

func _enter():
	print("[ENTER]: charge ready")
	tween = get_tree().create_tween()
	tween.tween_property(player, "modulate", Color.RED, 2)

func _exit():
	print("[EXIT]: charge ready")

func _update(_delta: float):
	statemachine.animPlayer.speed_scale += 0.002
	if (Input.is_action_pressed("action_key") && player.chargeAmount < max_charge_amount):
		player.chargeAmount += charge_amount_per_second * _delta
	if (Input.is_action_just_released("action_key") or player.chargeAmount >= max_charge_amount):
		statemachine.animPlayer.speed_scale = 1.0
		tween.kill()
		player.modulate = Color.WHITE
		Transitioned.emit(self, "spitstate")

func _physics_update(_delta: float):
	pass
