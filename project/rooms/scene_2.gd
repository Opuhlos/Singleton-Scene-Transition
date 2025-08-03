extends Node2D

@export var player: Area2D 

func _ready() -> void:
	if SceneManager.player_last_vector:
		player.position.x = 40.0
		player.position.y = SceneManager.player_last_vector.y
