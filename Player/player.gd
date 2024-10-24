extends CharacterBody2D


const SPEED = 450.0
const JUMP_VELOCITY = -600.0
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready() -> void:
	anim.play("idle")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	update_animation()
	move_and_slide()
	
func update_animation():
	if velocity.x < 0:
		anim.flip_h = true
	elif velocity.x > 0:
		anim.flip_h = false
	if velocity.x:
		anim.play("run")
	else:
		anim.play("idle")
	if velocity.y < 0:
		anim.play("jump")
	elif velocity.y > 0:
		anim.play("fall")
		
