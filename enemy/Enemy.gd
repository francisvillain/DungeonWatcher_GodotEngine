extends KinematicBody2D


var health = 1
var damage = 1
var direction = Vector2()
var speed = 220.0
var colliders : Dictionary = {
	"player" : 1,
	"enemy" : 2,
	"playerbullet" : 4,
	"enemybullet" : 8,
	"wall" : 16,
	"wall_collider" : 32
}



func _physics_process(delta):
	check_death()

		
	var motion = direction * speed * delta
	var collision_info = move_and_collide(motion)
	
	if collision_info:
		var collider = collision_info.get_collider()
		if collider.get_collision_layer() == colliders["player"]:
			collider.take_damage(self,damage, 0)

func take_damage(node, damage, effect):
	health -= damage

func check_death():
	if health <= 0:
		self.queue_free()

func set_direction(new_direction : Vector2):
	direction = new_direction
