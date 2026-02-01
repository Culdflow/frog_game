extends CharacterBody2D
class_name Frog

var gravity_speed = 0
var chargeAmount = 0
var isThrowing = false
@export var spitAngle: Node2D
@export var friction: = 1000
@export var gravity_speed_addr = 100
@export var max_fall_speed = 1500
@export var checkSlope: Area2D
@export var rotation_lerp := 10.0

func _ready() -> void:
	checkSlope.body_entered.connect(checkSlope_body_entered)

func _physics_process(delta: float) -> void:
	if (is_on_floor()):
		gravity_speed = 0
		var target_rotation = get_floor_normal().angle() + PI / 2
		rotation = lerp_angle(rotation, target_rotation, rotation_lerp * delta)
		
		velocity.x = move_toward(velocity.x, 0, friction)
	elif (velocity.y <= max_fall_speed):
		velocity.y += gravity_speed * delta
		gravity_speed += gravity_speed_addr
	#if collided and not get_floor_normal():
		#var slide_direction := get_last_slide_collision().get_normal()
		#velocity = velocity.slide(slide_direction)
	move_and_slide()

func checkSlope_body_entered(body):
	if (body is Slope):
		body.constant_angular_velocity += velocity.y / 1000
