extends BaseManager
class_name ShortcutManager

# Shortcut format
# [
# 	{
# 		"name": String,
# 		"action": String,
# 		"handler": Callable,
# 	}
# ]
var shortcut_list: Array[Dictionary]

func _ready() -> void:
	manager_name = "ShortcutManager"
	super._ready()

func _input(event: InputEvent) -> void:
	for shortcut in shortcut_list:
		if event.is_action_just_pressed(shortcut.action):
			shortcut.handler.call()
