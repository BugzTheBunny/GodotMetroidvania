extends Node
class_name State

@export var can_move : bool = true

func _physics_process(delta):
	pass

func _unhandled_input(event):
	pass
	
func update():
	pass

func enter():
	pass
	
func exit():
	pass

func _enter_tree():
	print("loaded: " + self.name + " state")
