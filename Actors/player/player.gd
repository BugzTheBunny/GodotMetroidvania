extends CharacterBody2D

@export var speed = 200.0

@onready var movement_vector : Vector2 = Vector2.ZERO 

func _process(delta):
	handle_movement(delta)

func handle_movement(delta):
	movement_vector = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	if movement_vector.x:
		print("all good!")
	else:
		print("not moving")
