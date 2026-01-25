extends CanvasLayer

# Connect the "pressed" signal from your Button to this script
func _on_restart_button_pressed() -> void:
	# Unfreeze the engine if you used Engine.time_scale or just reload
	get_tree().reload_current_scene()

# Helper function to show the UI
func show_victory() -> void:
	self.visible = true
	# English comment: You can add an AnimationPlayer trigger here
