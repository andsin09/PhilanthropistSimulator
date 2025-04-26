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

signal goodwill_created(goodwillAmount : int)

signal goodwill_consumed(goodwillAmount : int)

## Return current cash amount
func cash() -> int:
	return Game.ref.data.cash
	
func goodwill() -> int:
	return Game.ref.data.goodwill
	
func create_cash(amount : int) -> void:
	Game.ref.data.cash += amount
	cash_created.emit(amount)
	
func create_goodwill(goodwillAmount : int) -> void:
	Game.ref.data.goodwill += goodwillAmount
	goodwill_created.emit(goodwillAmount)
	
func consume_cash(amount : int) -> Error:
	if amount > Game.ref.data.cash:
		return Error.FAILED
	
	Game.ref.data.cash -= amount
	cash_consumed.emit(amount)
	
	return Error.OK
	
func consume_goodwill(goodwillAmount : int) -> Error:
	if goodwillAmount > Game.ref.data.goodwill:
		return Error.FAILED
	
	Game.ref.data.goodwill -= goodwillAmount
	goodwill_consumed.emit(goodwillAmount)
	
	return Error.OK
	
func cash_clicker() -> void:
	var quantity : int = 2
	quantity += Game.ref.data.up_01_level
	
