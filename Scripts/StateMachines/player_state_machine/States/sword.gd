extends State
class_name AttackState

@export var return_state : State
@export var default_state : GroundState

func _on_animation_tree_animation_finished(anim_name):
	if anim_name == "attack":
		next_state = return_state
