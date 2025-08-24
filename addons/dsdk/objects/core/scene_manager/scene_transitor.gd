extends AnimationPlayer
class_name SceneTransitor

func pull_on():
	play("pull_on")
	await animation_finished

func pull_off():
	play("pull_off")
	await animation_finished

func reset():
	play("RESET")
