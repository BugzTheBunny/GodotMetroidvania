extends CharacterBody2D
class_name Player

@export var animation_tree : AnimationTree
@export var animation_player : AnimationPlayer
@export var state_machine : PlayerStateMachine
@export var movement_component : PlayerMovementComponent


@onready var sprite : Sprite2D = $Sprite2D
@onready var hurtbox : Area2D = %Hurtbox

func _ready():
	$Hurtbox/CollisionShape2D.disabled = true
	animation_tree.active = true

func _physics_process(delta):
	movement_component.handle_sprite_facing = true
	animation_tree.set("parameters/Move/blend_position",movement_component.movement_axis)
	handle_sprite()
	move_and_slide()

func can_move() -> bool:
	return state_machine.current_state.can_move

func handle_sprite():
	if velocity.x > 0 :
		hurtbox.rotation_degrees = 0
	elif velocity.x < 0 :
		hurtbox.rotation_degrees = 180

