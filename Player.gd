class_name Player extends CharacterBody2D

@export var speed = 400

@export var Bullet : PackedScene
@export var shoot_cooldown = 0.5
@export var bullet_spawn_point : Node2D

@export var dash_speed = 1000
@export var dash_duration = 0.3
@export var dash_cooldown = 0.7
@export var health = 50


var shoot_timer = 0
var just_shot = false

var direction_before_dash : Vector2
var dash_timer = -1
var dash_cooldown_timer = 0
var just_dashed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

"""
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	velocity = _input_move()
	_dash(_delta)
	look_at(get_global_mouse_position())
	if dash_timer > -1 and dash_timer < dash_duration:
		velocity = direction_before_dash * dash_speed
		rotation = direction_before_dash.angle()
	move_and_slide()
	_input_shoot()
	_handle_timers(_delta)
	pass
	

func _input_move():
	var result_velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	result_velocity.x *= speed
	result_velocity.y *= speed
	
	return result_velocity

func _input_shoot():
	if Input.is_action_pressed("shoot") and !just_shot:
		var b = Bullet.instantiate()
		owner.add_child(b)
		b.global_transform = $bullet_spawn_point.global_transform
		just_shot = true

func _handle_timers(_delta):
	# shooting cooldown
	if just_shot:
		shoot_timer += _delta
		#print(shoot_timer)
		if shoot_timer >= shoot_cooldown:
			shoot_timer = 0
			just_shot = false
	
	if just_dashed and dash_timer >= dash_duration:
		dash_cooldown_timer += _delta
		if dash_cooldown_timer >= dash_cooldown:
			just_dashed = false
			dash_timer = -1
			dash_cooldown_timer = 0


func _dash(_delta):
	if just_dashed:
		if dash_timer < dash_duration:
			dash_timer += _delta
	elif Input.is_action_pressed("dash") and !just_dashed:
		direction_before_dash = (get_global_mouse_position()-self.global_position).normalized()
		dash_timer = 0
		just_dashed = true
	
"""
