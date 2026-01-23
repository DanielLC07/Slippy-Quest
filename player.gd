extends CharacterBody2D

# Movement constants
const MOVE_SPEED = 175
const JUMP_FORCE = -350
const GRAVITY = 1200
const FRICTION = 15.0 # Increased for a sharper/snappier stop
const COYOTE_TIME = 0.15 # Seconds allowed to jump after leaving a platform
var coyote_timer = 0.0   # Current timer value

# Node references
@onready var sprite = $SpritePlayer
@onready var animation_player = $AnimationPlayer

func _physics_process(delta):
	# 1. Gravity & Coyote Timer logic
	if is_on_floor():
		coyote_timer = COYOTE_TIME # Reset timer while on ground
	else:
		coyote_timer -= delta # Start counting down when falling
		velocity.y += GRAVITY * delta

	# 2. Jump logic
	# We use coyote_timer instead of is_on_floor()
	if coyote_timer > 0.0 and Input.is_action_just_pressed("Jump"):
		velocity.y = JUMP_FORCE
		coyote_timer = 0.0 # Prevent air-jumping after the first jump

	# 3. Horizontal Movement
	var input_horizontal = Input.get_axis("Move_Left", "Move_Right")
	
	if input_horizontal != 0:
		velocity.x = input_horizontal * MOVE_SPEED
		sprite.flip_h = input_horizontal > 0
	else:
		velocity.x = move_toward(velocity.x, 0, MOVE_SPEED * FRICTION * delta)

	move_and_slide()

	# 4. Animation Management
	if not is_on_floor():
		# This handles the mid-air animation. 
		# If you don't have one, just leave "pass" indented.
		pass 
	elif input_horizontal != 0:
		if animation_player.current_animation != "walk":
			animation_player.play("walk")
	else:
		if animation_player.current_animation != "idle":
			animation_player.play("idle")
