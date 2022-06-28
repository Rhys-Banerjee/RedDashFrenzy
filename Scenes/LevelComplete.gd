extends CanvasLayer



# Called when the node enters the scene tree for the first time.
func _ready():
	#$MarginContainer/VBoxContainer/Button.connect("pressed", self, "on_next_button_pressed")
	pass
	
func _process(delta):
	if Input.is_action_pressed("space"):
		LevelManager.increment_level()
	if Input.is_action_pressed("reset"):
		LevelManager.reset_level()
#func on_next_button_pressed():
	#$"/root/LevelManager".increment_level()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
