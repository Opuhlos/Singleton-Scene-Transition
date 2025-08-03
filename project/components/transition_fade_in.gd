extends Node2D

func _enter_tree() -> void:
	$AnimationPlayer.play("fade in")
	await $AnimationPlayer.animation_finished
	SceneManager.transition_animation_finished.emit()
	self.free()
