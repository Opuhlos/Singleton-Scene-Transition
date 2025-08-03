extends Node2D

@export var player: Player 

func _ready() -> void:
	if SceneManager.player_last_vector != Vector2.ZERO:
		player.position.x = 40.0
		player.position.y = SceneManager.player_last_vector.y
		player.set_face_direction(Player.FACE_DIRECTION.FACE_RIGHT)
