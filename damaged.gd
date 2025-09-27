extends Enemy_State

var direction_knockback: Vector2
var knockback_force: float
var timer: Timer

func enter(previous_state_path: String, data:= {})->void:
	print(enemy.name + " is in State: " + name)
	
	timer = get_node("Timer")
	timer.timeout.connect(_on_timer_timeout)
	
	enemy.health -= data["damage"]
	if enemy.health <= 0:
		enemy.queue_free()
	direction_knockback = -(enemy.position.direction_to(data["source"]))
	knockback_force = data["knockback"]
	
	print("\tEnemy health: " + str(enemy.health))
	print("\tbullet direction: " + str(direction_knockback))
	print("\tknockback: " + str(knockback_force))
	
	timer.start()
	
	

func _on_timer_timeout():
	finished.emit(HOSTILE)
