extends Area2D

# This variable shows up in the Inspector to let you assign a spawn point node
@export var respawn_node: Marker2D

func _on_body_entered(body: Node2D) -> void:
	# Check if the object entering the area belongs to the "Player" group
	if body.is_in_group("Player"):
		# Teleport the player to the exact global position of the assigned Marker2D
		body.global_position = respawn_node.global_position
		
		# Reset the player's velocity to prevent them from "sliding" or falling after respawning
		if "velocity" in body:
			body.velocity = Vector2.ZERO
		
		# Debug message to confirm the respawn logic triggered correctly
		print("Player rescued! Respawn position set to: ", respawn_node)
