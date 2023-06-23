extends Node
class_name PlayerStateMachine

@export var states : Array[State]
@export var initial_state : State
@export var animation_player : AnimationPlayer

signal transitioned(state: State)

var current_state : State

func _ready():
	_load_states()
	_enter_initial_state()

func _load_states():
	for child in get_children():
		if child is State:
			states.append(child)
		else:
			print(child.name + " Is not a state")

func _enter_initial_state():
	initial_state.enter()

func on_transitioned(new_state: State):
	print(new_state.name)
	current_state = new_state
