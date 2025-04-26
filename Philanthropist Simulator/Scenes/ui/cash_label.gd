class_name LabelsCash
extends Label
## Displays total cash from all sources

func _ready() -> void:
	upd_text()
	CashHandler.ref.cash_created.connect(upd_text)
	CashHandler.ref.cash_consumed.connect(upd_text)

func upd_text(_amount : int = -1) -> void:
	text = "Cash: %s" %CashHandler.ref.cash()
