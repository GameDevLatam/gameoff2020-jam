extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var dir = -int(Input.is_key_pressed(KEY_LEFT)) + int(Input.is_key_pressed(KEY_RIGHT))
	if (dir > 0 || dir < 0):
		rotate(0.025 * dir);
#	pass
