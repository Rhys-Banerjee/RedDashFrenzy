extends CanvasLayer

#onready var playButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/Button
#onready var quitButton = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/Button2

#var levelManager = load("res://Scenes/LevelManager.gd").new()

#func _ready():
	#playButton.connect("pressed", self, "on_play_pressed")
	#quitButton.connect("pressed", self, "on_quit_pressed")
	#pass

#func on_play_pressed():
	#$"/root/LevelManager".change_level(0)

#func on_quit_pressed():
#	get_tree().quit()

func _process(delta):
	if Input.is_action_just_pressed("space"):
		#$"/root/LevelManager".change_level(0)
		LevelManager.change_level(0)
	elif Input.is_action_just_pressed("q"):
		get_tree().quit()
