extends BaseManager
class_name SettingsManager

var default_settings_path: String = "user://settings.json"

var default_settings: Dictionary
var _settings: Dictionary = default_settings.duplicate()

signal settings_changed(settings: Dictionary)

func _ready() -> void:
	manager_name = "SettingsManager"
	super._ready()
	load_settings()
	apply_settings()

func get_settings() -> Dictionary:
	return _settings

func set_settings(new_settings: Dictionary) -> void:
	_settings = new_settings
	settings_changed.emit(_settings)
	save_settings()

func get_setting(key: String) -> Variant:
	if key in _settings:
		return _settings[key]
	else:
		if key in default_settings:
			return default_settings[key]
		else:
			return null

func mutate_settings(key: String, value: Variant) -> void:
	_settings[key] = value
	settings_changed.emit(_settings)
	save_settings()

func save_settings() -> void:
	var file = FileAccess.open(default_settings_path, FileAccess.WRITE)
	file.store_string(JSON.stringify(_settings))
	file.close()

func load_settings() -> void:
	var file = FileAccess.open(default_settings_path, FileAccess.READ)
	if file:
		var text = file.get_as_text()
		file.close()
		var json = JSON.new()
		var err = json.parse(text)
		if err == OK:
			var result = json.get_data()
			if typeof(result) == TYPE_DICTIONARY:
				_settings = result
				settings_changed.emit(_settings)

func apply_settings() -> void:
	pass
