extends Node
class_name PlayerStateMachine

@export var player : Player
@export var current_state : State
@export var movement_component : PlayerMovementComponent
@export var animation_tree : AnimationTree

var states : Array[State]

func _ready():
	setup_states()
	
func _physics_process(delta):
	if (current_state.next_state != null):
		switch_states(current_state.next_state)
		
	current_state.state_process(delta)
	
func switch_states(new_state:State):
	# If switching state, use on exit of state
	if current_state != null:
		current_state.on_exit()
		current_state.next_state = null
		
	current_state = new_state
	
	current_state.on_enter()

# Managing state input
func _input(event:InputEvent):
	current_state.state_input(event)

# Handling initial states creation list and appending requirements for states.
func setup_states():
	for child in get_children():
		if child is State:
			child.player = player
			child.playback = animation_tree["parameters/playback"]
			child.animation_tree = animation_tree
			states.append(child)
		else:
			push_warning(child.name + " is not a State")
