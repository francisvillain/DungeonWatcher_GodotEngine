extends Control

onready var label = $Label

func _process(delta):
	label.set_text(GlobalNode.preprocessed_time())
