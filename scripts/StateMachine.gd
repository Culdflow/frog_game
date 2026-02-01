extends Node
class_name StateMachine

@export var initial_state: State
@export var animPlayer: AnimationPlayer
@export var player: Frog

var current_state: State
var states: Dictionary = {}

func _ready():
	for child in get_children():
		states[child.name.to_lower()] = child
		child.Transitioned.connect(_on_child_transition)
	if initial_state:
		initial_state._enter()
		current_state = initial_state
		#animPlayer.play(current_state.name.to_lower())

func _process(delta: float) -> void:
	if current_state:
		current_state._update(delta)

func _physics_process(delta: float) -> void:
	if current_state:
		current_state._physics_update(delta)

func _on_child_transition(state, new_state_name):
	if state != current_state:
		return
	var new_state : State = states.get(new_state_name.to_lower())
	if !new_state:
		return  
	if current_state:
		current_state._exit()
	current_state = new_state
	new_state._enter()
	#animPlayer.play(current_state.name.to_lower())
