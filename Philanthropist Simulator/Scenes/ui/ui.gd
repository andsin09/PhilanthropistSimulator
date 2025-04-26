class_name UI
extends Control
## UI Class

##set of navigation options
enum Screens {
	CLICKER_V2,
	HELPER_V2,
	UPGRADES_V4,
}

## the signal used to navigate
signal navigating_queued(screen: Screens)

## if selecting clicker
func _on_clicker_link_pressed():
	navigating_queued.emit(Screens.CLICKER_V2)

## if selecting easy mode (shame on you)
func _on_assist_link_pressed():
	navigating_queued.emit(Screens.HELPER_V2)


func _on_upgrades_link_pressed():
	navigating_queued.emit(Screens.UPGRADES_V4)


