extends Node

var _objects: Dictionary[String, Variant]

func get_singleton(singleton: String) -> Variant:
	if not _objects.has(singleton):
		push_error("Singleton %s not found" % singleton)
		return null
	return _objects[singleton]

func set_singleton(singleton: String, object: Variant) -> void:
	_objects[singleton] = object

func remove_singleton(singleton: String) -> void:
	_objects.erase(singleton)
