extends Motion


func enter():
	.enter()
	owner.get_node("AnimationPlayer").play("idle")


func update(_delta):
	var input_direction = get_input_direction()
	if input_direction:
		emit_signal("finished", "move")
