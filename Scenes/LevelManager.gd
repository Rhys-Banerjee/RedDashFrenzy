extends Node

export(Array, PackedScene) var levelScenes

var currentLevelIndex = 0



func change_level(levelIndex):
	print("does this work?")
	currentLevelIndex = levelIndex
	#if (currentLevelIndex >= levelScenes.size()):
		#currentLevelIndex = 0
	get_tree().change_scene(levelScenes[currentLevelIndex].resource_path)
	
func increment_level():
	change_level(currentLevelIndex + 1)

func reset_level():
	change_level(currentLevelIndex)
	
