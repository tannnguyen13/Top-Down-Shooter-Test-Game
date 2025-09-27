class_name State extends Node

# this data is probably going to be very useful for sending info about damage and
# knockback force
signal finished(next_state_path: String, data: Dictionary) 

## Called by the state machine receiving unhandled input events
# FROM: https://forum.godotengine.org/t/why-do-tutorials-use-unhandled-input-event-instead-of-input-event/88084
	# "Unhandled input is recommended to be used on player characters so that if a menu is open. 
	# The menu can use regular input and set events as handled. This will allow the menu to get 
	# the input before the player and prevent player from doing actions while the menu is up."
func handle_input(_event: InputEvent) -> void:
	pass

# parameters are interesting, previous_state_path probably could come in handy when behaviors differ
# based on the previous state,
func enter(previous_state_path: String, data:= {})->void:
	pass
	
# clean up before actually switching the state
func exit()-> void:
	pass
	
# call this in the main state controller process; pass in that _delta function
func update(_delta: float) -> void:
	pass

func physics_update(_delta: float) -> void:
	pass
