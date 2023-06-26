extends State
class_name GroundState

@export var air_state : AirState
@export var attack_state : AttackState

func _ready():
	movement_component = get_parent().movement_component
	movement_component.connect("sig_jump",on_jump)
	movement_component.connect("sig_double_jump",on_double_jump)

func state_process(delta):
	if player.is_on_floor():
		playback.travel("Move")

func state_input(event:InputEvent):
	if event.is_action_pressed("action"):
		on_attack()
		
func on_jump():
	next_state = air_state
	playback.travel("jump")

func on_double_jump():
	pass

func on_attack():
	next_state = attack_state
	playback.travel("attack")
	
