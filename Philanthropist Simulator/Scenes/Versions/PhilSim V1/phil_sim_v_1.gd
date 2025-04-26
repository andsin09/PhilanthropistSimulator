##normal mode
class_name PhilSimV1
extends Control


@export var screen : UI.Screens

@export var user_interface : UI
##variables needed
var cash : int = 0

##function section

##start function to update what is needed
func _ready() -> void:	
	visible = true
	
	user_interface.navigating_queued.connect(_on_navigating_queued)

##the function that updates cash
func generate_cash() -> void:
	CashHandler.ref.create_cash(1)
	


##what runs on clicking the dollar
func _on_button_pressed() -> void:
	CashHandler.ref.cash_clicker()


## navigate the user if requested
func _on_navigating_queued(requested_screen : UI.Screens) -> void:
	if requested_screen == screen:
		visible = true
		return
	visible = false
