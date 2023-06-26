extends Node
class_name State

@export var can_move : bool = true :
	get: return can_move
	set(value): can_move = value

var player : Player
var next_state : State
var animation_tree: AnimationTree
var movement_component: PlayerMovementComponent
var playback : AnimationNodeStateMachinePlayback

func state_process(delta):
	pass

func state_input(event):
	pass
	
func on_enter():
	pass
	
func on_exit():
	pass
