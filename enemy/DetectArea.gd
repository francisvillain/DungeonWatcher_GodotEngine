extends Area2D

var player = null

signal move(new_direction)

func _on_DetectArea_body_entered(body):
	if body.get_name() == 'Player':
		player = body
	
func _physics_process(delta):
	if player:
		emit_signal("move", get_parent().position.direction_to(player.position))
