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
switch "
	else:
		resettimer -= delta

func _on_button_down():
	self.text = "Press the key you want to assign."
	lookingforkey = true

func _input(event):
	if event is InputEventKey and event.pressed and lookingforkey:
		InputMap.action_erase_events("switch")
		InputMap.action_add_event("switch", event)
		self.text = "Swap set to " + str(event.as_text())
		resettimer = resettimermax
		lookingforkey = false
