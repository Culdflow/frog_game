extends Line2D

@export var sprite: Sprite2D


func _process(delta: float) -> void:
	add_point(sprite.global_position)
	if points.size() > 100:
		remove_point(0)
