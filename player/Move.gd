extends Motion

func enter():
	.enter()
	speed = 0.0
	velocity = Vector2()

	var input_direction = get_input_direction()
	owner.get_node("AnimationPlayer").play("walk")

func handle_input(event):
#	if event.is_action_pressed("roll") and get_parent().get_node("Roll").can_roll:
#		emit_signal("finished", "roll")
	return .handle_input(event)


func update(_delta):
	var input_direction = get_input_direction()
	if not input_direction:
		emit_signal("finished", "idle")
		
	speed = max_walk_speed

	var collision_info = move(speed, input_direction)
	if not collision_info:
		return
	if speed == max_run_speed and collision_info.collider.is_in_group("environment"):
		return null


func move(speed, direction):
	velocity = direction.normalized() * speed
	owner.move_and_slide(velocity, Vector2(), 5, 2)
	if owner.get_slide_count() == 0:
		return
	return owner.get_slide_collision(0)
