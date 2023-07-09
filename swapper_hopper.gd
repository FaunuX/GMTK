extends Node

enum ValidStates {
	V1,
	V2
}

@export var state: ValidStates
@export var is_moving_platform: bool
@export var offset = Vector2(0, -320)
@export var duration = 5.0

# Called when the node enters the scene tree for the first time.
func _ready():
	if is_moving_platform:
		$Scene1.Offset = offset
		$Scene1.Duration = duration
		$Scene1.start_tween()
	render_state()

func render_state():
	if state == ValidStates.V1:
		if is_moving_platform:
			$Scene1.tween.play()
		$Scene1/CollisionShape2D.set_deferred("disabled", false)
		$Scene1.visible = true
		$Scene2/CollisionShape2D.set_deferred("disabled", true)
		$Scene2.visible = false
	else:
		if is_moving_platform:
			$Scene2.position = $Scene1.position
			$Scene1.tween.pause()
		$Scene1/CollisionShape2D.set_deferred("disabled", true)
		$Scene1.visible = false
		$Scene2/CollisionShape2D.set_deferred("disabled", false)
		$Scene2.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("switch"):
		if state == ValidStates.V1:
			state = ValidStates.V2
		else:
			state = ValidStates.V1
		render_state()
