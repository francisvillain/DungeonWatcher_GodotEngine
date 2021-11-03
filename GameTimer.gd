extends Timer



func _process(delta):
	set_actual_time()

func set_actual_time():
	GlobalNode.time_left = int(self.time_left)
	
func set_timer_status(time_dict : Dictionary):
	self.set_wait_time(time_dict["time_left"])
	self.start()
	self.set_actual_time()

func set_timer_status_start(time_dict : Dictionary):
	self.set_wait_time(time_dict["wait_time"])
	self.start()

func _on_timeout():
	GlobalNode.restart()
