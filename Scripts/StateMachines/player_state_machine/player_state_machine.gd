extends Node
class_name PlayerStateMachine

@export var current_state : State

var states : Array[State]

func _ready():
	setup_states()
	
func setup_states():
	for child in get_children():
		if child is State:
			states.append(child)
			
			# MovementComponent
			
			# Animation Tree
			
		else:
			push_warning(child.name + " is not a State")
