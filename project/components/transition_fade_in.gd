extends Node2D

func _ready() -> void:
	$AnimationPlayer.play("fade in")
	await $AnimationPlayer.animation_finished
	SceneManager.transition_animation_finished.emit()
	self.free()
