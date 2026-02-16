extends Line2D
class_name boom_line

@export var sprite: Sprite2D
var point_size = 100

func _process(delta: float) -> void:
	add_point(sprite.global_position)
	if points.size() > point_size:
		remove_point(0)
