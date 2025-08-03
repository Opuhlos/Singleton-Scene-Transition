extends Node

func _ready() -> void:
	$Panel/Button.pressed.connect(_on_button_pressed)

func _process(_delta: float) -> void:
	# Clicking escape while in the pause menu will exit the pause menu
	if Input.is_action_just_pressed("escape"):
		SceneManager.is_pause_menu_visible = false
		queue_free()

func _on_button_pressed() -> void:
	SceneManager.transition_scene.emit("res://ui/main menu/main_menu.tscn")
