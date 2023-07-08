extends Node

var coins = 0
var total_coins = 0
var scene
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func next_level():
	if str(get_tree().current_scene.get_path()) == "/root/Level 1":
		scene = 3
	if str(get_tree().current_scene.get_path()) == "/root/Level 2":
		scene = 4
	if str(get_tree().current_scene.get_path()) == "/root/Level 3":
		scene = 2
	if str(get_tree().current_scene.get_path()) == "/root/Level 4":
		scene = 5
	if str(get_tree().current_scene.get_path()) == "/root/Level 5":
		scene = 6
	if str(get_tree().current_scene.get_path()) == "/root/Level 6":
		scene = 7
	if str(get_tree().current_scene.get_path()) == "/root/Level 7":
		scene = 8
	if str(get_tree().current_scene.get_path()) == "/root/Level 8":
		scene = 9
	if str(get_tree().current_scene.get_path()) == "/root/Level 9":
		scene = 10
	if str(get_tree().current_scene.get_path()) == "/root/Level 10":
		scene = 11
	if str(get_tree().current_scene.get_path()) == "/root/Level 11":
		scene = 12
	print(get_tree().current_scene.get_path())
	get_tree().change_scene_to_file("res://Level " + str(scene) + ".tscn")


func _collect_coin(body, node):
	coins += 1
	$Coinsound.play()
	$CanvasLayer/GUI/Label.text = str(coins)
	$Level.call_deferred("remove_child", node.get_parent().get_parent())
	if coins == total_coins:
		next_level()



func _on_level_child_entered_tree(node):
	for child in node.find_child("*").find_children("Scene1"):
		total_coins += 1
		child.connect("body_entered", self._collect_coin.bind(child))
