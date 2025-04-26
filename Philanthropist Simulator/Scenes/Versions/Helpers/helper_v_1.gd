##easy mode
class_name HelperV2
extends Control


@export var button : Button

@export var timer : Timer

@export var screen : UI.Screens

@export var user_interface : UI

##initialize our variables
var cash : int = 0

##functions

##built-in function to start
func _ready() -> void:
	
	visible = false
	
	user_interface.navigating_queued.connect(_on_navigating_queued)


##making our cash
func gen_cash() -> void:
	CashHandler.ref.create_cash(1)


##how the generator works
func begin_gen() -> void:
	timer.start()
	button.disabled = true

##starting the generator
func _on_button_pressed() -> void:
	begin_gen()


func _on_timer_timeout():
	gen_cash()

## Check if user is navigating and then do so
func _on_navigating_queued(requested_screen : UI.Screens) -> void:
	if requested_screen == screen:
		visible = true
		return
	visible = false
