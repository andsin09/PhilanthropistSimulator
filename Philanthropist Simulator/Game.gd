class_name Game
extends Node
## main game node

static var ref : Game

func _singleton_check() -> void:
	if not ref: 
		ref = self
		return
	
	queue_free()

## Actual data
var data : Data

## Initialize data
func _enter_tree() -> void:
	_singleton_check()
	data = Data.new()
