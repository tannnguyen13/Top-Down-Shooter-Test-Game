class_name StateMachine extends Node
## can extend this to make an enemy and a player state machine

# set the initial state and can set it in the inspector
@export var initial_state: State = null

# on ready is functionally the same as calling something in _ready() 
# but onready is called before _ready()
@onready var state: State = (func get_initial_state() -> State:
	return initial_state if initial_state != null else get_child(0)
).call()

func _ready() -> void:
	for state_node: State in find_children("*", "State"):
		# we connect the signal from the state to the function "_transition_to_next_state"
		state_node.finished.connect(_transition_to_next_state) 
		
	#We want to wait until the root node is ready before we start our state machine
	await owner.ready
	state.enter("") #since this is the first state, we're passing in an empty string since that's 
	# the "previous state"
	
func _transition_to_next_state(target_state_path: String, data: Dictionary = {}) -> void:
	# error message if state does not exist
	if not has_node(target_state_path):
		printerr(owner.name + ": Trying to transition to state " + target_state_path + " but it does not exist.")
		return
	
	#transition code
	var prev_state := state.name #save exiting state
	state.exit() #have that state exit
	state = get_node(target_state_path) #find the next state
	state.enter(prev_state, data) #enter that state
	
func _unhandled_input(event: InputEvent) -> void:
	state.handle_input(event)
	
func _process(delta: float)-> void:
	state.update(delta)
	
func _physics_process(delta: float) -> void:
	state.physics_update(delta)
