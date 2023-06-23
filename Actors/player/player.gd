extends CharacterBody2D
class_name Player

@export var state_machine : PlayerStateMachine

@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var sprite : Sprite2D = $Sprite2D
@onready var hurtbox : Area2D = %Hurtbox

func _ready():
	$Hurtbox/CollisionShape2D.disabled = true
	state_machine = $StateMachine
	
func _process(delta):
	handle_sprite()
	handle_sword()
	move_and_slide()

func handle_sprite():
	if velocity.x > 0 :
		sprite.flip_h = false
		hurtbox.rotation_degrees = 0
	elif velocity.x < 0 :
		sprite.flip_h = true
		hurtbox.rotation_degrees = 180
		
func handle_sword():
	if Input.is_action_just_pressed("action"):
		animation_player.play("Sword")
