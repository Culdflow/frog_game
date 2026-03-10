extends Camera2D
class_name PlayerCamera

@export var follow_x: bool = false
@export var follow_y: bool = false
@export var frog: Frog
var camera_height

func _ready() -> void:
	zoom = Vector2(0.8, 0.8)
	global_position.x = frog.global_position.x
	camera_height = get_viewport().size.y / zoom.y

func _physics_process(delta: float) -> void:
	if (follow_y):
		global_position.y = frog.global_position.y
	if (follow_x):
		global_position.x = frog.global_position.x
	if (!follow_x and !follow_y):
		if (frog.global_position.y < global_position.y - (camera_height / 2)):
			global_position.y -= camera_height
		elif (frog.global_position.y > global_position.y + (camera_height / 2)):
			global_position.y += camera_height
