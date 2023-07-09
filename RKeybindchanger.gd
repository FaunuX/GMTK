extends Button
var lookingforkey = false
var resettimer = 0
var resettimermax = 1
var clickdetecting
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta): 
	if resettimer <= 0:
		self.text = "Change keybind:
reset level "
	else:
		resettimer -= delta
	if clickdetecting:
		if Input.is_action_just_pressed("switch"):
			self.text = "Press the key you want to assign."
			lookingforkey = true

func _on_button_down():
	self.text = "Press the key you want to assign."
	lookingforkey = true

func _input(event):
	if event is InputEventKey and event.pressed and lookingforkey:
		InputMap.action_erase_events("reset")
		InputMap.action_add_event("reset", event)
		self.text = "reset set to " + str(event.as_text())
		resettimer = resettimermax
		lookingforkey = false


func _on_area_2d_area_entered(area):
	if area == $"../Cursor":
		clickdetecting = true


func _on_area_2d_area_exited(area):
	if area == $"../Cursor":
		clickdetecting = false
