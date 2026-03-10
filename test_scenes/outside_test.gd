extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(get_viewport_rect())
	print(get_viewport().get_visible_rect())
	print(get_viewport_transform())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
