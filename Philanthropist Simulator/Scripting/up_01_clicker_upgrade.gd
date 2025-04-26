class_name Up01ClickerUpgrade
extends Node
## Upgrade 01 - Gain 1 Goodwill Per Second

## Emits when upgrade levels up
signal leveled_up

## upgrade level
var level : int = 0
## Upgrade name
var title : String = "Clicker Upgrade"
## Base cost
var base_cost : int = 30
## Current cost
var cost : int

## Load data.
func _init() -> void:
	level = Game.ref.data.up_01_level
	calculate_cost()


## Returns description
func description() -> String:
	var description : String = "Helpers join your charity!"
	description += "\n2 cash p/c"
	description += "\nCost : %s" %cost
	
	return description


## Returns current cost based on level and base cost.
func calculate_cost() -> void:
	cost = (base_cost * pow(1.5, level))
	
	
func can_afford() -> bool:
	if CashHandler.ref.cash() >= cost:
		return true
	
	return false


func level_up() -> void:
	var error : Error = CashHandler.ref.consume_cash(cost)
	
	if not error:
		level += 1
		Game.ref.data.up_01_level = level
		
		calculate_cost()

		leveled_up.emit()
