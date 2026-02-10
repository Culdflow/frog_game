extends Node2D

@export var mesh: MeshInstance3D
@export var light: SpotLight3D
@export var camera: Camera3D
@export var player: Frog
@export var back_sprite: Sprite2D


func _process(delta: float) -> void:
	var player_y = player.position.y
	var mat = mesh.get_active_material(0)
	mat.uv1_offset.y = player_y * 0.0005
	var player_x = player.position.x
	light.light_energy = max(-player_y * 0.001, 0.2)
	camera.rotation_degrees.y = player_x * 0.01
	back_sprite.position.y = player_y - 400
