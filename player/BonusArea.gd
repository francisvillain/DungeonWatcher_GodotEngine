extends Area2D


func _on_BonusArea_body_entered(body):
	if body.get_collision_layer() == 64:
		body.take_damage(self,0,0)
