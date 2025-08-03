extends Node2D

@export var player: Area2D 

func _ready() -> void:
	if SceneManager.player_last_vector != Vector2.ZERO:
		player.position.x = 1112.0
		player.position.y = SceneManager.player_last_vector.y
