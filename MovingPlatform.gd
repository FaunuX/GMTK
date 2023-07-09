extends AnimatableBody2D

@export var Offset = Vector2(0, -320)
@export var Duration = 5.0

var tween

func start_tween():
	tween = get_tree().create_tween().set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween.set_loops().set_parallel(false)
	tween.tween_property(self, "position", Offset, Duration / 2)
	tween.tween_property(self, "position", Vector2.ZERO, Duration / 2)
