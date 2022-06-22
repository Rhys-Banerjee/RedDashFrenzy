extends Node2D

export(PackedScene) var levelCompleteScene

var playerScene = preload("res://scenes/Player.tscn")
var spawnPosition = Vector2.ZERO
var currentPlayerNode = null




# Called when the node enters the scene tree for the first time.
func _ready():
	spawnPosition = $Player.global_position
	register_player($Player)
	$Goal.connect("player_won",self,"on_player_won")


func register_player(player):
	currentPlayerNode = player
	currentPlayerNode.connect("died", self, "on_player_died", [], CONNECT_DEFERRED)
	
func create_player():
	var playerInstance = playerScene.instance()
	add_child_below_node(currentPlayerNode, playerInstance)
	playerInstance.global_position = spawnPosition
	register_player(playerInstance)

func on_player_died():
	currentPlayerNode.queue_free()
	create_player()
	
func on_player_won():
	currentPlayerNode.queue_free()
	var levelComplete = levelCompleteScene.instance()
	add_child(levelComplete)
	
