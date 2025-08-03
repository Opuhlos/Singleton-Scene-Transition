extends Node2D

@export var player: Player 

func _ready() -> void:
	if SceneManager.player_last_vector != Vector2.ZERO:
		player.position.x = 1112.0
		player.position.y = SceneManager.player_last_vector.y
	
	# Set the direction the player is facing based on whether they entered from 
	# scene 2 or not. If entering form scene 2, which is from the left -> they
	# should now be facing the right
	if SceneManager.previous_scene and SceneManager.previous_scene == "Scene_2":
		player.set_face_direction(Player.FACE_DIRECTION.FACE_RIGHT)
	else: 
		player.set_face_direction(Player.FACE_DIRECTION.FACE_DOWN)
