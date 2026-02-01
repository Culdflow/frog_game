extends CharacterBody2D
class_name Boomerang

@export var speed: int = 1000
var max_dist = 100
var frog: Frog
var dist = 0

func _physics_process(delta: float) -> void:
	move_and_slide()
	if (dist >= max_dist):
		velocity = Vector2.from_angle(get_angle_to(frog.global_position)) * speed
		if (abs(global_position - frog.global_position).length() < 50):
			_despawn()
	else:
		print("dist : ", dist )
		dist += velocity.length() * delta
	

func _start(_vel: Vector2, _dist: int, _frog: Frog, pos: Vector2):
	velocity = _vel * speed
	max_dist = _dist
	frog = _frog
	global_position = pos
	dist = 0

func _despawn():
	frog.isThrowing = false
	queue_free()
