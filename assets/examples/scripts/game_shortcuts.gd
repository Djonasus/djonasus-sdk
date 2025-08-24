extends ShortcutManager
class_name GameShortcuts

func _ready() -> void:
	shortcut_list = [
		{
			"name": "Fullscreen",
			"action": "fullscreen",
			"handler": _toggle_fullscreen
		}
	]
	
	super._ready()

func _toggle_fullscreen():
	# Do your magic
	pass
