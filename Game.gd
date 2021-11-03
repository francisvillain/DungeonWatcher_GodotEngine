extends Node2D

onready var win_screen = $CanvasLayer/WinScreen

func _ready():
	GlobalNode.ROOT = self
	$GameTimer.set_timer_status_start(GlobalNode.get_timer_status())

func win():
	win_screen.visible = true
