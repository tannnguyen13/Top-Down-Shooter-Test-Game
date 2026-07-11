extends Enemy_State

var direction_knockback: Vector2
var knockback_force: float
var knockback_seconds: float
var damage_timer: Timer

func _ready()->void:
	super._ready()
	damage_timer = get_node("Damaged_Timer")		
	damage_timer.timeout.connect(_on_timer_timeout)	

func enter(previous_state_path: String, data:= {})->void:
	print(enemy.name + " is in State: " + name)
	
	enemy.health -= data["damage"]
	if enemy.health <= 0:
		enemy.queue_free()
	direction_knockback = -(enemy.position.direction_to(data["source"]))
	knockback_force = data["knockback"]
	knockback_seconds = data["duration"]
	
	print("\tEnemy health: " + str(enemy.health))
	print("\tbullet direction: " + str(direction_knockback))
	print("\tknockback: " + str(knockback_force))
	
	damage_timer.start(knockback_seconds)

func update(_delta: float) -> void:
	enemy.position += direction_knockback * knockback_force	* _delta
	

func _on_timer_timeout():
	finished.emit(HOSTILE)
