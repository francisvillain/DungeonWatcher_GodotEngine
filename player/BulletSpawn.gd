extends Node2D

class_name BulletSpawn

onready var arm : Position2D = $ArmPoint
var bullet = preload("res://player/Bullet.tscn")

func _ready():
	randomize()

func fire() -> void:
	var direction : Vector2 = -(self.get_global_position()-arm.get_global_position()).normalized()
	if not $CooldownTimer.is_stopped():
		return
	owner.fire()
	$CooldownTimer.start()
	var new_bullet = bullet.instance()
	new_bullet.set_global_position(arm.get_global_position())
	new_bullet.direction = direction
	add_child(new_bullet)

func _unhandled_input(event):
	if event.is_action_pressed("fire") and owner.active:
		fire()
