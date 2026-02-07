extends Node2D

func _process(delta: float) -> void:
	var player_y = $Frog.position.y
	var mat = $SubViewportContainer/SubViewport/MeshInstance3D.get_active_material(0)
	mat.uv1_offset.y = player_y * 0.0005
	var player_x = $Frog.position.x
	$SubViewportContainer/SubViewport/DirectionalLight3D.light_energy = max(-player_y * 0.001, 0.2)
	$SubViewportContainer/SubViewport/Camera3D.rotation_degrees.y = player_x * 0.01
	$Sprite2D.position.y = player_y
