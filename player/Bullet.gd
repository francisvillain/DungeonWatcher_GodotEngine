extends KinematicBody2D

class_name Bullet

onready var root = get_tree().root
var direction = Vector2()
var bullet_distance : float = 0
var weapon_range : float
export(float) var speed = 410.0
export(String) var check_collider
var is_visible_on_screen = true

var colliders : Dictionary = {
	"player" : 1,
	"enemy" : 2,
	"playerbullet" : 4,
	"enemybullet" : 8,
	"wall" : 16,
	"wall_collider" : 32
}


func _ready():
	set_as_toplevel(true)


func _physics_process(delta):

	var motion = direction * speed * delta
	bullet_distance += speed*delta
	
	var collision_info = move_and_collide(motion)
	
	if collision_info:
		var collider = collision_info.get_collider()
		if collider.get_collision_layer() == colliders["wall"]:
			explode()
		if not collider.get_collision_layer() == colliders[check_collider] :
			if not collider.get_collision_layer() == colliders["wall_collider"] + colliders[check_collider]:
				return
		if collider.is_a_parent_of(self):
			return
		collider.take_damage(self,1, 0)
		explode()

func take_damage(attacker,amount, effect = null):
	if is_a_parent_of(attacker):
		return
	explode()

func explode():
	queue_free()


