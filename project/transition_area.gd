extends Area2D

func _ready() -> void:
	self.area_entered.connect(_on_area_entered)

func _process(delta: float) -> void:
	pass

func _on_area_entered(area: Area2D):
	print(area.position)
	SceneManager.player_last_vector = area.position
	# You could just do this with a function call to the function that
	# actually changes the scene but I wanted to use signals for fun
	SceneManager.transition_scene.emit("res://rooms/scene_2.tscn")
