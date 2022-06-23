extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(Color, RGB) var backgroundColor

func _ready():
	VisualServer.set_default_clear_color(backgroundColor)
# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
