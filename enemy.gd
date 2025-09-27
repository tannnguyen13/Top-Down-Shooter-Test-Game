class_name Enemy extends CharacterBody2D


@export var health = 3
@export var SPEED = 200.0

var player : CharacterBody2D

### *** OBSOLETE, USING STATE MACHINE AND CONTROLLER NOW
func _ready() -> void:
	player = get_tree().get_nodes_in_group("player")[0]



"""
func _process(delta):
	_handle_move(delta)
	move_and_slide()

func _handle_move(delta):
	#print(input_damage)
	print(got_hit)
	if got_hit:
		print("getting hit!")
		await got_hit == false
	look_at(player.global_position)
	position += transform.x * SPEED * delta

func take_damage(source, damage, knockback):
	input_damage += damage
	got_hit = true
	
	process_damage(source, knockback)

func process_damage(source, knockback):
	health -= input_damage
	#print(health)
	
	# knockback
	var direction = -(self.position.direction_to(source.position))
	process_knock_back(direction, knockback)
	await got_hit == false
	input_damage = 0
	
func process_knock_back(directionOfSource,knockback):
	#print("getting knocked back")
	velocity = directionOfSource * knockback
	await get_tree().create_timer(1000).timeout
	got_hit = false
"""
