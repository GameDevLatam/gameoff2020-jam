extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var grav_dir = Vector2.DOWN
var facing = Vector2.RIGHT

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _integrate_forces(state):
	if state.total_gravity.length_squared() > 25:
		grav_dir = state.total_gravity.normalized()
		facing = grav_dir.tangent()
	var dir = -int(Input.is_key_pressed(KEY_LEFT)) + int(Input.is_key_pressed(KEY_RIGHT))
	var jump = int(Input.is_key_pressed(KEY_Z))
	if dir != 0 and state.linear_velocity.length_squared() < 10000:
		state.linear_velocity += (facing * dir * 10)
	state.linear_velocity += grav_dir * -jump * 10
	$icon.rotation = lerp_angle( $icon.rotation, facing.angle(), 0.1)
	$Polygon2D.position = state.linear_velocity
