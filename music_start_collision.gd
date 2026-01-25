extends Area2D

#  Drag the music file here
@export var zone_music: AudioStream 



func _on_body_entered(body: Node2D) -> void:
	# This will print EVERY TIME anything touches the area
	print("!!! TRIGGER TOUCHED BY: ", body.name)
	
	if body.is_in_group("Player"):
		print("Player group confirmed. Attempting to play music...")
		
		var music_player = get_tree().current_scene.find_child("BackgroundMusic", true, false)
		
		if music_player and zone_music:
			music_player.stream = zone_music
			music_player.play()
			print("Music should be playing now!")
			queue_free()
		else:
			print("Error: Missing MusicPlayer or MusicFile")
