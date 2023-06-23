extends Node
class_name PlayerMovementComponent

@export var velocity_component : VelocityComponent
@export var gravity : float = 30
@export var jump_velocity : float = 600

var movement_axis : float = 0

var is_double_jumped : bool = false

func _physics_process(delta):
	handle_movement(delta)
	handle_gravity()
	handle_jump()
	handle_double_jump()
	reset_double_jump()

func reset_double_jump():
	if owner.is_on_floor():
		is_double_jumped = false

func handle_movement(delta):
	movement_axis = Input.get_axis("left","right")
	if movement_axis:
		owner.velocity.x = velocity_component.speed * sign(movement_axis)
		owner.animation_player.play("Walk")
	else:
		owner.velocity.x = move_toward(owner.velocity.x, 0, velocity_component.speed)

func handle_double_jump():
	if !is_double_jumped and Input.is_action_just_pressed("jump") and !owner.is_on_floor():
		is_double_jumped = true
		owner.animation_player.play("Jump")
		owner.velocity.y =- jump_velocity

func handle_jump():
	if Input.is_action_just_pressed("jump") and owner.is_on_floor():
		owner.animation_player.play("Jump")
		owner.velocity.y =- jump_velocity

func handle_gravity():
	if !owner.is_on_floor():
		owner.velocity.y += gravity
		owner.animation_player.play("Fall")
