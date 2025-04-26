class_name UpgradesV1
extends Control

@export var screen : UI.Screens

@export var user_interface : UI

## Initialize our label at the start
func _ready() -> void:
	
	visible = false
	
	user_interface.navigating_queued.connect(_on_navigating_queued)
	
func _on_navigating_queued(requested_screen : UI.Screens) -> void:
	if requested_screen == screen:
		visible = true
		return
	visible = false
