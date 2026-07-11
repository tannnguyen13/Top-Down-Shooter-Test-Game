extends Area2D

@export var speed = 700
@export var output_damage = 1
@export var knockbackForce = 100
@export var knockbackTime = 0.1
@export var valid_hit_groups = ["enemy"]

signal hit(source_position: Vector2, knockbackForce: float, output_damage: int, knockbackTime: float)



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position += transform.x * speed * delta
	
func _on_Bullet_entered_body(body):
	for target_group in valid_hit_groups:
		if body.is_in_group(target_group):
			#print("hit valid target, target group in: " + target_group)
			var target_curr_state = body.get_node("State Machine")
			if target_curr_state:
				#print("\tFound target's State Machine")
				#print("\t"+target_curr_state.state.name)
				target_curr_state = target_curr_state.get_node(str(target_curr_state.state.name))
				if target_curr_state && target_curr_state.has_method("take_damage"):
					hit.connect(target_curr_state.take_damage)
					hit.emit(global_position, knockbackForce, output_damage, knockbackTime)
			
			#body.take_damage(self, output_damage, knockbackForce)
		self.queue_free()
