extends CanvasLayer

@onready var main_container = $MainContainer

func _ready():
	self.hide()
	# English: Prepare the container for the pop effect
	if main_container:
		main_container.scale = Vector2.ZERO
		call_deferred("_setup_pivot")

func _setup_pivot():
	if main_container:
		main_container.pivot_offset = main_container.size / 2

func appear():
	# English: This makes the UI visible and triggers the animation
	self.show()
	if main_container:
		var tween = get_tree().create_tween()
		tween.tween_property(main_container, "scale", Vector2.ONE, 0.5)\
			.set_trans(Tween.TRANS_BACK)\
			.set_ease(Tween.EASE_OUT)


func _on_restart_button_pressed() -> void:
	# English: Unpause the game if you used get_tree().paused = true
	get_tree().paused = false
	
	# English: Reload the current level from the beginning
	print("Restarting level...")
	get_tree().reload_current_scene()
