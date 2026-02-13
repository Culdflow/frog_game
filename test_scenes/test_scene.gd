extends Node2D

@export var mesh: MeshInstance3D
@export var light: SpotLight3D
@export var camera2d: Camera2D
@export var camera: Camera3D
@export var player: Frog
@export var back_sprite: Sprite2D
var can_run: bool = false


func _process(delta: float) -> void:
	if can_run:
		var player_y = camera2d.global_position.y
		var mat = mesh.get_active_material(0)
		mat.uv1_offset.y = player_y * 0.0005
		var player_x = player.global_position.x - back_sprite.global_position.x
		light.light_energy = max(-player_y * 0.001, 0.2)
		camera.rotation_degrees.y = player_x * 0.005
		back_sprite.position.y = player_y - 400
	if (mesh && light && camera && player && back_sprite):
		can_run = true
