extends Node2D


class_name Weapon

var active : bool = false

var cooldown_time : float 
var reload_time : float = 2.0
var direction : String
var label : String
var statistics : Dictionary

#var blast = preload("res://particle/Blast.tscn")
onready var gun = $AnimationPlayer


func _ready():
	$Sprite.rotation_degrees = 0
	active = true
	#self.set_name("MainWeapon")

	
func change_direction(dir : String) -> void:
	direction = dir
	match dir:
		'right':
			self.scale = Vector2(1,1)
			#$Sprite.flip_v = false
		'left':
			self.scale = Vector2(1,-1)
			#$Sprite.flip_v = true	

func fire()-> void:
	gun.stop()
	gun.play("fire")
	#GlobalData.shake_camera()

