extends CharacterBody2D
class_name Boomerang

@export var speed: int = 1000
@export var turn_speed := 8.0
var max_dist = 100
var frog: Frog
var dist = 0
var returning := false

func _physics_process(delta: float) -> void:
	# Track distance traveled
	dist += velocity.length() * delta
	if dist >= max_dist:
		returning = true

	if returning:
		var to_frog := (frog.global_position - global_position).normalized()
		var desired_velocity := to_frog * speed
		velocity = velocity.lerp(desired_velocity, turn_speed * delta)

	move_and_slide()

	if get_slide_collision_count() > 0:
		var collision := get_slide_collision(0)
		velocity = velocity.bounce(collision.get_normal())

	# ---- DESPAWN ----
	if returning and global_position.distance_to(frog.global_position) < 40:
		_despawn()

func _start(_vel: Vector2, _dist: int, _frog: Frog, pos: Vector2):
	velocity = _vel * speed
	max_dist = _dist
	frog = _frog
	global_position = pos
	dist = 0

func _despawn():
	frog.isThrowing = false
	frog.boom = null
	queue_free()


func _on_wall_detection_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
