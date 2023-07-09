extends Node2D
var velocity = Vector2()
@export var speed = 50
signal clicked
# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("move_right"):
		velocity.x += speed*delta
		visible = true
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed*delta
		visible = true
	if Input.is_action_pressed("move_down"):
		velocity.y += speed*delta
		visible = true
	if Input.is_action_pressed("jump"):
		velocity.y -= speed*delta
		visible = true
	position += velocity
	velocity = Vector2()
