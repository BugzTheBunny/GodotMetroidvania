extends Label

@export var state_machine : PlayerStateMachine

func _physics_process(delta):
	text = state_machine.current_state.name
