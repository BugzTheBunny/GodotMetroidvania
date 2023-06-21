extends CharacterBody2D

@export var speed = 200.0

@onready var movement_axis : float = 0
@onready var sprite : Sprite2D = $Sprite2D
@onready var anim_player : AnimationPlayer = $AnimationPlayer

func _process(delta):
	handle_movement(delta)
	handle_sprite()
	move_and_slide()
	

func handle_movement(delta):
	movement_axis = Input.get_axis("ui_left","ui_right")
	if movement_axis:
		velocity.x = speed * sign(movement_axis)
		anim_player.play("Walk")
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		anim_player.play("Idle")

func handle_sprite():
	if movement_axis > 0 :
		sprite.flip_h = false
	elif movement_axis < 0 :
		sprite.flip_h = true
			
