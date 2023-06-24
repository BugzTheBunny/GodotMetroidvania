extends State
class_name GroundState

var parent : PlayerStateMachine
var player : CharacterBody2D

func _ready():
	parent = get_parent()
	player = parent.get_parent()
	parent.transitioned.connect(enter.bind(self))

	
func _to_physic_proccess(delta):
	if player.is_on_floor():
		parent.animation_player.play("Idle")
	
func enter():
	pass
func exit():
	pass
