extends Area2D

@export var player: unit_stats

var player_name: String
var speed: int

func _ready() -> void:
	$Sprite2D.texture = player.texture
	name = player.name
	speed = player.speed

func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	var direction: Vector2 = Vector2.ZERO
	
	if Input.is_action_pressed("left"):
		direction.x = -1
	if Input.is_action_pressed("right"):
		direction.x = 1
	if Input.is_action_pressed("up"):
		direction.y = -1
	if Input.is_action_pressed("down"):
		direction.y = 1
	
	position += direction.normalized() * speed * delta
