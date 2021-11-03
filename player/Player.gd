extends KinematicBody2D

var current_direction : String
var health = 2
signal state(state_name)

func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	look_direction_mouse()
	check_death()


func look_direction_mouse() -> void:
	var detect_dir : String
	if get_global_mouse_position().x - get_global_position().x > 0:
		detect_dir = 'right'
	else:
		detect_dir = 'left'
	
	if current_direction != detect_dir:
		#emit_signal("direction_changed", detect_dir)
		change_direction(detect_dir)
		current_direction = detect_dir


func change_direction(new_direction : String) -> void:
	for weapon in get_node("WeaponPivot").get_children():
		weapon.change_direction(new_direction)
	
	var weapons_position = get_node("WeaponPivot").get_position()
	
	match new_direction:
		'right':
			get_node("Body").flip_h = false
			get_node("CollisionPolygon2D").scale = Vector2(1,1)
			if weapons_position.x < 0:
				get_node("WeaponPivot").set_position(Vector2(-1,1)*weapons_position)
		'left':
			get_node("Body").flip_h = true
			get_node("CollisionPolygon2D").scale = Vector2(-1,1)
			if weapons_position.x > 0:
				get_node("WeaponPivot").set_position(Vector2(-1,1)*weapons_position)

func take_damage(node,damage, effect):
	health -= damage
	emit_signal("state","stagger")

func check_death():
	if health <= 0:
		GlobalNode.restart()
