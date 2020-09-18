extends Node2D

signal exited

func _ready():
	set_process(true)

func _process(delta):
	if(self.visible):
		if Input.is_action_pressed("ui_cancel"):
			emit_signal("exited")
			
func hide():
	self.visible = false

func show():
	self.visible = true
