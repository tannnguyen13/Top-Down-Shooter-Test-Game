class_name Player_State extends State

const ACTION = "Action"
const DASH = "Dash"
const DAMAGED = "Damaged"

var player: Player

func _ready() -> void:
	await owner.ready
	player = owner as Player
	assert(player!=null, "The Player_State state type must be used only in the player scene. It needs the owner to be an Player node.")
