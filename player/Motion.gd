extends State
# Collection of important methods to handle direction and animation.

class_name Motion

var speed = 0.0
var velocity = Vector2()

var max_walk_speed : float 
export(float) var max_run_speed = 700


func handle_input(event):
	pass
#	if event.is_action_pressed("simulate_damage"):
#		emit_signal("finished", "stagger")

func enter():
	owner.get_node("CollisionPolygon2D").set_deferred("disabled",false)
	max_walk_speed = 450

func get_input_direction():
	var input_direction = Vector2(
			Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
			Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	)
	return input_direction
