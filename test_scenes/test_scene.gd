extends Node2D

@export var mesh: MeshInstance3D
@export var light: SpotLight3D
@export var camera2d: PlayerCamera
@export var top_level_camera: Camera2D
@export var effect: ColorRect
@export var top_well_area: Node2D
@export var camera: Camera3D
@export var player: Frog
@export var back_sprite: Sprite2D
@export var bpm_sound: AudioStreamPlayer
@export var bruh_sfx: AudioStreamPlayer
@export var rythm_notifier: RhythmNotifier
var can_run: bool = false
var on_top :bool = false

func _ready() -> void:
	rythm_notifier.beats(1).connect(func(count):
		if player.global_position.y < -200:
			bruh_sfx.playing = true
		else:
			bruh_sfx.playing = false)
	bpm_sound.play()


func _process(delta: float) -> void:
	if can_run:
		var player_y = camera2d.get_target_position().y
		var mat = mesh.get_active_material(0)
		if (player_y - (get_viewport_rect().size.y / 2) > (camera2d.limit_top)):
			mat.uv1_offset.y = player_y * 0.0005
		var player_x = player.global_position.x - back_sprite.global_position.x
		effect.material.set_shader_parameter("vignette_intensity", 6 - abs(player_y * 0.0002))
		light.light_energy = max(-player_y * 0.001, 0.2)
		#camera.rotation_degrees.y = player_x * 0.005
		if (player_y > (camera2d.limit_top + 400)):
			back_sprite.global_position.y = player_y - 400
		if player.global_position.y < top_well_area.global_position.y:
			top_level_camera.make_current()
			effect.material.set_shader_parameter("vignette_intensity", 0)
			player.sprite.material.set_shader_parameter("width", 10)
		else:
			player.sprite.material.set_shader_parameter("width", 20)
			camera2d.make_current()
	if (mesh && light && camera && player && back_sprite):
		can_run = true
		


func _on_hide_player_body_entered(body: Node2D) -> void:
	if body is Frog:
		player.sprite.visible = false


func _on_hide_player_body_exited(body: Node2D) -> void:
	if body is Frog:
		player.sprite.visible = true
