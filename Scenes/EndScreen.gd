extends Node2D




func _ready():
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_just_pressed("space"):
		$"/root/LevelManager".change_level(10)
