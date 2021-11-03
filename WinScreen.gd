extends Control


func _on_TextureButton_pressed():
	self.visible = false
	GlobalNode.restart_vanilla()
