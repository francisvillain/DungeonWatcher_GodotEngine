extends StaticBody2D

onready var light = $Light2D
onready var mask_light = $Light2Mask
onready var sprite = $Sprite

func take_damage(node, damage, effect):
	if !light.visible:
		light.visible = true
		mask_light.visible = true
		sprite.self_modulate = Color('ffc500')
