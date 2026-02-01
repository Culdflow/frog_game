extends State
class_name ChargingState

@export var charge_amount_per_second: int = 30
@export var max_charge_amount: int = 100

func _enter():
	print("[ENTER]: charging")

func _exit():
	print("[EXIT]: charging")

func _update(_delta: float):
	if (Input.is_action_pressed("action_key") && player.chargeAmount < max_charge_amount):
		player.chargeAmount += charge_amount_per_second * _delta
	print("charge amount: ", player.chargeAmount)
	if (Input.is_action_just_released("action_key") or player.chargeAmount >= max_charge_amount):
		Transitioned.emit(self, "spitstate")

func _physics_update(_delta: float):
	pass
