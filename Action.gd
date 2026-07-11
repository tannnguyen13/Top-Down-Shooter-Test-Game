extends Player_State

var shoot_timer: Timer

func _ready() -> void:
	super._ready()
	shoot_timer = get_node("Shoot_Timer")

# parameters are interesting, previous_state_path probably could come in handy when behaviors differ
# based on the previous state,
func enter(previous_state_path: String, data:= {})->void:
	print(player.name + " is in state: " + name)

func update(_delta: float) -> void:
	player.velocity = _input_move()
	player.move_and_slide()
	player.look_at(player.get_global_mouse_position())
	_input_shoot()
	
	#_dash(_delta)
	#_handle_timers(_delta)

func handle_input(_event: InputEvent) -> void:
	pass

# clean up before actually switching the state
func exit()-> void:
	pass
	
# call this in the main state controller process; pass in that _delta function


func physics_update(_delta: float) -> void:
	pass
	

### ===== MOVEMENT HELPERS ======
func _input_move():
	var result_velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	result_velocity.x *= player.speed
	result_velocity.y *= player.speed
	
	return result_velocity

func _input_shoot():
	if Input.is_action_pressed("shoot") and shoot_timer.is_stopped():
		var b = player.Bullet.instantiate()
		player.owner.add_child(b)
		b.global_transform = player.bullet_spawn_point.global_transform
		shoot_timer.start(player.shoot_cooldown)
