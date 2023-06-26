extends State
class_name AirState

@export var ground_state : GroundState
@export var attack_state : AttackState

func state_input(event:InputEvent):
	if event.is_action_pressed("action"):
		on_attack()

func on_attack():
	next_state = attack_state
	playback.travel("attack")
	

func state_process(delta):
	if player.is_on_floor():
		next_state = ground_state
