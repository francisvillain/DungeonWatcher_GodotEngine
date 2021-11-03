extends Area2D



func _on_Portal_body_entered(body):
	if body.get_name() == "Player":
		GlobalNode.win_game()
