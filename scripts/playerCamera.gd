extends Camera2D
class_name PlayerCamera

@export var follow_x: bool = true
@export var frog: Frog

func _ready() -> void:
	zoom = Vector2(0.8, 0.8)
	offset.y = -400
	global_position.x = frog.global_position.x

func _physics_process(delta: float) -> void:
	global_position.y = frog.global_position.y
	if (follow_x):
		global_position.x = frog.global_position.x
