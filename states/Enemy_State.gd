class_name Enemy_State extends State

const HOSTILE="Hostile"
const DAMAGED="Damaged"

var enemy: Enemy

func _ready() -> void:
	await owner.ready
	enemy = owner as Enemy
	assert(enemy != null, "The Enemy_State state type must be used only in the enemy scene. It needs the owner to be an Enemy node.")
