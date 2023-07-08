extends Button
@export var level = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	self.text = level


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	get_tree().change_scene_to_file("res://Level " + str(level) + ".tscn")
