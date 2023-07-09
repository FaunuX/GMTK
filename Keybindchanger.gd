extends Button
var lookingforkey = false
var resettimer = 0
var resettimermax = 1
var clickdetection
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
	if clickdetection:
		if Input.is_action_just_pressed("switch"):
			self.text = "Press the key you want to assign."
			lookingforkey = true

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


func _on_area_2d_area_entered(area):
	if area == $"../../Cursor":
		clickdetection = true


func _on_area_2d_area_exited(area):
	if area == $"../../Cursor":
		clickdetection = false
