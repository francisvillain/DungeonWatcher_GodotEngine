extends State


func enter():
	.enter()
	owner.get_node("AnimationPlayer").play("stagger")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == 'stagger':
		emit_signal("finished",'idle')
