extends Camera2D

var targetPosition = Vector2.ZERO

#export(Color, RGB) var backgroundColor
func _init():
	current = true

func _process(delta):
	acquire_target_position()
	
	global_position = lerp(targetPosition, global_position, pow(2,-15 * delta))

func acquire_target_position():
	var players = get_tree().get_nodes_in_group("Player")
	if (players.size() > 0):
		var player = players[0]
		targetPosition = player.global_position
