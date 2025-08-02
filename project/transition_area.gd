extends Area2D

func _ready() -> void:
	self.area_entered.connect(_on_area_entered)

func _process(delta: float) -> void:
	pass

func _on_area_entered(area: Area2D):
	SceneManager.transition_scene.emit("res://rooms/scene_2.tscn")
