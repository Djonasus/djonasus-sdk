extends BaseManager
class_name FlagsPool

var _flags: Dictionary = {}

func _ready() -> void:
	manager_name = "FlagsPool"
	super._ready()

func add_flag(flag: String) -> void:
	if not _flags.has(flag):
		_flags[flag] = true

func set_flag(flag: String) -> void:
	_flags[flag] = true

func remove_flag(flag: String) -> void:
	_flags.erase(flag)

func has_flag(flag: String) -> bool:
	return _flags.has(flag)

func get_flags() -> Dictionary:
	return _flags.duplicate()

func set_flags(flags: Dictionary) -> void:
	_flags = flags.duplicate()
