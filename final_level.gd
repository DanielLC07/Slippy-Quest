extends Area2D

# English: Remember to drag "WinUITextures" to this slot in the Inspector
@export var victory_ui: CanvasLayer 

func _ready() -> void:
	# English: Force connection to be sure it triggers
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	# English: Debug to see if the collision even happens
	print("Contact at Goal with: ", body.name)
	
	if body.is_in_group("Player"):
		print("PLAYER DETECTED - Stopping game...")
		
		# 1. English: Stop movement and physics
		if body is CharacterBody2D:
			body.velocity = Vector2.ZERO # English: Stop current speed
			body.set_physics_process(false) # English: Disable gravity/input
			body.process_mode = Node.PROCESS_MODE_DISABLED # English: Full freeze
		
		# 2. English: Show the UI
		if victory_ui:
			victory_ui.appear()
		else:
			print("!!! ERROR: VictoryUI is not assigned in the Inspector!")
