class_name CashHandler
extends Node
## manages cash and the related signals to it for a smoother experience

static var ref : CashHandler

## ensure this is the only instance 
func _enter_tree() -> void:
	if not ref: 
		ref = self
		return
	
	queue_free()
	
## Emitted when cash is made
signal cash_created(amount : int)

## Emitted when cash is used
signal cash_consumed(amount: int)

	
## Return current cash amount
func cash() -> int:
	return Game.ref.data.cash
	
func create_cash(amount : int) -> void:
	Game.ref.data.cash += amount
	cash_created.emit(amount)
	
func consume_cash(amount : int) -> Error:
	if amount > Game.ref.data.cash:
		return Error.FAILED
	
	Game.ref.data.cash -= amount
	cash_consumed.emit(amount)
	
	return Error.OK
