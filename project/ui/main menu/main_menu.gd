extends Node

func _ready() -> void:
	$VBoxContainer/Button.pressed.connect(_on_button_pressed)
	SceneManager.player_last_vector = Vector2.ZERO

func _on_button_pressed() -> void:
	SceneManager.transition_scene.emit("res://rooms/scene_1.tscn")
