extends Node

signal transition_scene(scene_path: String)
signal transition_animation_finished

var current_scene: Node = null
var player_last_vector: Vector2

var is_pause_menu_visible: bool = false
var is_transitioning: bool = false

func _ready() -> void:
	# Set the current scene
	var root: Window = get_tree().root
	# Using a negative index counts from the end, so this gets the last child node of `root`,
	# which is the current scene
	current_scene = root.get_child(-1)
	
	# Connect the transition_area_entered signal to its corresponding function
	transition_scene.connect(goto_scene)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("escape") and !is_pause_menu_visible and !is_transitioning:
		var menu_packed: PackedScene = ResourceLoader.load("res://ui/pause menu/pause_menu.tscn")
		var menu: Node = menu_packed.instantiate()
		current_scene.add_child(menu)
		is_pause_menu_visible = true

func goto_scene(scene_path: String):	
	is_transitioning = true
	# Load the transition scene
	var transition_out_packed: PackedScene = ResourceLoader.load("res://components/transition_fade_out.tscn")
	# Instantiate it
	var transition_out: Node2D = transition_out_packed.instantiate()
	# Add it to the scene tree so that the animation may play
	current_scene.add_child(transition_out)
	
	# Wait for the animation to finish
	await transition_animation_finished
	
	# Using Object.call_deferred makes it so that the function "deferred_goto_scene"
	# is only ran once all the code from the current scene has completed
	# Thus, the current scene will not be removed while it is still being used 
	_deferred_goto_scene.call_deferred(scene_path)

func _deferred_goto_scene(scene_path: String):
	# It is now safe to remove the current scene
	current_scene.free()
	
	# Load the new scene
	var new_scene: PackedScene = ResourceLoader.load(scene_path)
	
	# Instance the new scene
	current_scene = new_scene.instantiate()
	
	# Add it to the active scene, as child of root
	get_tree().root.add_child(current_scene)
	
	# Load the transition scene
	var transition_out_packed: PackedScene = ResourceLoader.load("res://components/transition_fade_in.tscn")
	# Instantiate it
	var transition_out: Node2D = transition_out_packed.instantiate()
	# Add it to the scene tree so that the animation may play
	current_scene.add_child(transition_out)
	is_transitioning = false
