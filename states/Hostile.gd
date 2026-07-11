extends Enemy_State

func enter(previous_state_path: String, data:= {})->void:
	#can call animation once i add that in
	#wprint(enemy.name + " is in State: " + name)
	pass
	
func update(_delta: float) -> void:
	#turn towards player
	
	enemy.rotation = (enemy.player.global_position - enemy.global_position).angle()
	enemy.position += enemy.transform.x * enemy.SPEED * _delta

func take_damage(source_position: Vector2, knockbackForce: float, output_damage: int, knockbackTime: float):
	var return_data = {"source":source_position, "knockback":knockbackForce, "damage":output_damage, "duration": knockbackTime}
	finished.emit(DAMAGED, return_data)
