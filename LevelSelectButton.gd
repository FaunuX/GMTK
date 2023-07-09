extends Button
@export var level = 1
var clickdetecting
# Called when the node enters the scene tree for the first time.
func _ready():
	self.text = str(level)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if clickdetecting:
		if Input.is_action_just_pressed("switch"):
			get_tree().change_scene_to_file("res://Level " + str(level) + ".tscn")


func _on_pressed():
	get_tree().change_scene_to_file("res://Level " + str(level) + ".tscn")


func _on_area_2d_area_entered(area):
	if area == $"../Cursor":
		clickdetecting = true


func _on_area_2d_area_exited(area):
	if area == $"../Cursor":
		clickdetecting = false
