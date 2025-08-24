extends BaseManager
class_name SceneManager

@export
var scene_transitor: PackedScene

var _current_scene: Node
var _scene_transitor: SceneTransitor

var _st_container = "st_container"
var _s_container = "s_container"

signal scene_changed(scene: Node)

func _ready() -> void:
	manager_name = "SceneManager"
	super._ready()
	
	_add_container(_s_container)
	_add_container(_st_container)
	reload_transitor()

# Change scene with transition
func change_scene(scene: PackedScene) -> void:
	await _scene_transitor.pull_on()
	if _current_scene:
		_current_scene.queue_free()
	_current_scene = scene.instantiate()
	get_node("./"+_s_container).add_child(_current_scene)
	await _scene_transitor.pull_off()
	scene_changed.emit(_current_scene)

# Reload scene transitor
func reload_transitor() -> void:
	if _scene_transitor:
		_scene_transitor.queue_free()
	_scene_transitor = scene_transitor.instantiate()
	get_node("./"+_st_container).add_child(_scene_transitor)
	_scene_transitor.reset()

# Get current scene
func get_current_scene() -> Node:
	return _current_scene

func _add_container(container_name: String):
	var container = Node2D.new()
	container.name = container_name
	add_child(container)
