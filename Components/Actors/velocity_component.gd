extends Node
class_name VelocityComponent

@export var speed : float = 200
@export var jump_velocity : float = 600

func _ready():
	print("loaded: " + self.name)
