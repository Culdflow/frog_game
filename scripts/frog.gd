extends CharacterBody2D
class_name Frog

var chargeAmount = 0
var isThrowing = false
var boom: Boomerang = null
@export var spitAngle: Node2D
@export var friction: = 1000
@export var gravity_speed_addr = 100
@export var max_fall_speed = 1500
@export var rotation_lerp := 10.0
@export var slide_speed := 120.0

func _physics_process(delta: float) -> void:
	if is_on_floor():
		var floor_normal := get_floor_normal()
		var rot_val = get_floor_angle(Vector2.UP)
		rotation = rot_val

		# Tangent along the slope
		var slope_tangent := Vector2(floor_normal.y, -floor_normal.x).normalized()

		# Downhill direction from gravity projection
		var downhill := Vector2.DOWN.project(slope_tangent)

		if downhill.length() > 0.001:
			var slide_dir := downhill.normalized()
			if (slide_dir.x < 0):
				rotation = -rot_val

			# Preserve any perpendicular velocity, replace only slope component
			var perp := velocity - velocity.project(slope_tangent)
			velocity = perp + slide_dir * slide_speed
		else:
			# Flat ground
			velocity.x = move_toward(velocity.x, 0, friction)
			velocity.y = 0
	else:
		velocity.y = min(velocity.y + gravity_speed_addr * delta, max_fall_speed)

	move_and_slide()
