extends Node

signal transition_scene(scene_path: String)
signal transition_animation_finished

var current_scene: Node = null
var player_last_vector: Vector2

func _ready() -> void:
	# Set the current scene
	var root: Window = get_tree().root
	# Using a negative index counts from the end, so this gets the last child node of `root`,
	# which is the current scene
	current_scene = root.get_child(-1)
	
	# Connect the transition_area_entered signal to its corresponding function
	transition_scene.connect(goto_scene)

func goto_scene(scene_path: String):	
	
	var transition_out_packed: PackedScene = ResourceLoader.load("res://components/transition_fade_out.tscn")
	var transition_out: Node2D = transition_out_packed.instantiate()
	current_scene.add_child(transition_out)
	
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
	
	var transition_out_packed: PackedScene = ResourceLoader.load("res://components/transition_fade_in.tscn")
	var transition_out: Node2D = transition_out_packed.instantiate()
	current_scene.add_child(transition_out)
