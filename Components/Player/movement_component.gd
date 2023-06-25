extends Node
class_name PlayerMovementComponent

@export var velocity_component : VelocityComponent
@export var gravity : float = 30
@export var jump_velocity : float = 600

@export var handle_sprite_facing = false :
	get:
		return handle_sprite_facing
	set(value):
		handle_sprite_facing = value

var player : Player
var movement_axis : float = 0
var is_double_jumped : bool = false

func _ready():
	player = get_parent() as Player

func _physics_process(delta):
	if handle_sprite_facing:
		handle_sprite_facing_direction()
	handle_movement(delta)
	handle_gravity()
	handle_jump()
	handle_double_jump()
	reset_double_jump()

func handle_sprite_facing_direction():
	if owner.velocity.x > 0 :
		owner.sprite.flip_h = false
	elif owner.velocity.x < 0 :
		owner.sprite.flip_h = true

func reset_double_jump():
	if owner.is_on_floor():
		is_double_jumped = false

func handle_movement(delta):
	movement_axis = Input.get_axis("left","right")
	if movement_axis and player.can_move():
		owner.velocity.x = velocity_component.speed * sign(movement_axis)
	else:
		owner.velocity.x = move_toward(owner.velocity.x, 0, velocity_component.speed)

func handle_double_jump():
	if !is_double_jumped and Input.is_action_just_pressed("jump") and !owner.is_on_floor():
		is_double_jumped = true
		owner.velocity.y =- jump_velocity

func handle_jump():
	if Input.is_action_just_pressed("jump") and owner.is_on_floor():
		owner.velocity.y =- jump_velocity

func handle_gravity():
	if !owner.is_on_floor():
		owner.velocity.y += gravity
