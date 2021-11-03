extends StaticBody2D


onready var sprite = $Sprite
var bonus_time = randi() % 10 + 5

func take_damage(node, damage, effect):
	print(node.name)
	GlobalNode.get_bonus_time(bonus_time)
	print("bonus time: ", bonus_time)
	queue_free()
