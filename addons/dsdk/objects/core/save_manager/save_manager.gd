extends BaseManager
class_name SaveManager

var default_save_path: String = "user://saves/"
var save_data: Dictionary

func _ready() -> void:
	manager_name = "SaveManager"
	super._ready()

func save_game(slot: String) -> void:
	var file = FileAccess.open(default_save_path + slot + ".json", FileAccess.WRITE)
	file.store_string(JSON.stringify(save_data))
	file.close()

func load_game(slot) -> void:
	var file = FileAccess.open(default_save_path + slot + ".json", FileAccess.READ)

	if file == null:
		push_error("Save file not found")
		return

	var json = JSON.new()
	var save_data = json.parse(file.get_as_text())
	file.close()

	if save_data == OK:
		save_data = json.data
	else:
		push_error("Error loading save game")
