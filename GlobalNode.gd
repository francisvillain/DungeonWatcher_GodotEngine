extends Node


var ROOT : Node
var time_left : float = 30
var wait_time : float = 30

	
func restart():
	ROOT.get_tree().reload_current_scene()
	
func restart_vanilla():
	time_left  = 30
	wait_time  = 30
	ROOT.get_tree().reload_current_scene()
	
func preprocessed_time():
	return str(int(time_left))

func get_timer_status():
	var status : Dictionary = {
		"time_left" : time_left,
		"wait_time" : wait_time
	}
	
	return status

func get_bonus_time(bonus_time):
	time_left += bonus_time
	wait_time += bonus_time
	ROOT.get_node("GameTimer").set_timer_status(get_timer_status())

func win_game():
	print("Win!")
	ROOT.win()
