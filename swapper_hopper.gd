extends Node

enum ValidStates {
	V1,
	V2
}

@export var state: ValidStates

# Called when the node enters the scene tree for the first time.
func _ready():
	render_state()

func render_state():
	print("yodooga")
	if state == ValidStates.V1:
		$Scene1/CollisionShape2D.set_deferred("disabled", false)
		$Scene1.visible = true
		$Scene2/CollisionShape2D.set_deferred("disabled", true)
		$Scene2.visible = false
	else:
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
