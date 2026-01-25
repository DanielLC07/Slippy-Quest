extends Area2D

#  Drag the Marker2D (the spawn point of the next area) here
@export var target_spawn: Marker2D

func _ready() -> void:
	#  Connect the signal
	if not body_entered.is_connected(_on_body_entered):
		body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		if target_spawn == null:
			print("!!! ERROR: No target_spawn Marker2D assigned!")
			return
			
		teleport_player(body)

func teleport_player(player: Node2D) -> void:
	# 1.  Stop the current music
	var music_player = get_tree().current_scene.find_child("BackgroundMusic", true, false)
	if music_player:
		music_player.stop()
		print("Music stopped for transition.")
	
	# 2.  Move the player to the new location
	player.global_position = target_spawn.global_position
	print("Player teleported to: ", target_spawn.name)
	
	# 3.  Optional - Reset velocity so the slime doesn't "slide" into the new area
	if player is CharacterBody2D:
		player.velocity = Vector2.ZERO
