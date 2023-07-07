extends Button
var lookingforkey = false
var resettimer = 0
var resettimermax = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta): 
	if resettimer <= 0:
		self.text = "Change keybind:
swap "
	else:
		resettimer -= delta

func _on_button_down():
	self.text = "Press the key you want to assign."
	lookingforkey = true

func _input(event):
	if event is InputEventKey and event.pressed and lookingforkey:
		InputMap.action_erase_events("swap")
		InputMap.action_add_event("swap", event)
		self.text = "Swap set to " + str(event.as_text())
		resettimer = resettimermax
		lookingforkey = false
