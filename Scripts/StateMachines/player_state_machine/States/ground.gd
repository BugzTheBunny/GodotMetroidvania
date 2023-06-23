extends State
class_name GroundState

var parent : PlayerStateMachine

func _ready():
	parent = get_parent()
	parent.transitioned.connect(enter.bind(self))
	
func enter():
	parent.animation_player.play("Idle")

func exit():
	pass
