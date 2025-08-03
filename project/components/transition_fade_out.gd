extends Node2D

# I was previously using the _on_ready callback but that plays the animation 
# when its instantiated. However, I want it to play when its added to scene tree
# so that the player sees it.
func _enter_tree() -> void:
	$AnimationPlayer.play("fade out")
	await $AnimationPlayer.animation_finished
	SceneManager.transition_animation_finished.emit()
	queue_free()
