extends Position2D


func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	self.look_at(get_global_mouse_position())
