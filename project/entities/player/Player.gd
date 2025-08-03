extends Area2D
class_name Player

enum FACE_DIRECTION {FACE_UP, FACE_DOWN, FACE_LEFT, FACE_RIGHT}

@export var stats: player_stats
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var player_name: String
var speed: int

func _ready() -> void:
	name = stats.name
	speed = stats.speed

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
	
	if Input.is_action_pressed("down"):
		sprite.play("walk_down")
	elif Input.is_action_pressed("up"):
		sprite.play("walk_up")
	elif Input.is_action_pressed("right"):
		sprite.play("walk_right")
	elif Input.is_action_pressed("left"):
		sprite.play("walk_left")
	else:
		sprite.stop()
	
	position += direction.normalized() * speed * delta

func set_face_direction(direction: FACE_DIRECTION):
	if direction == FACE_DIRECTION.FACE_UP:
		sprite.play("walk_up")
	elif direction == FACE_DIRECTION.FACE_DOWN:
		sprite.play("walk_down")
	elif direction == FACE_DIRECTION.FACE_LEFT:
		sprite.play("walk_left")
	elif direction == FACE_DIRECTION.FACE_RIGHT:
		sprite.play("walk_right")
	
	sprite.stop()
