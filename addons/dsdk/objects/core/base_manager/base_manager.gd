extends Node
class_name BaseManager

var manager_name: String = "BaseManager"

func _ready() -> void:
	SingletonManager.set_singleton(manager_name, self)

func _exit_tree() -> void:
	SingletonManager.remove_singleton(manager_name)
