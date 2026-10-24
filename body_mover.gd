extends RigidBody2D

@export var vel_MAX : float
@export var vel_MIN : float


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("test")):
		linear_velocity.y = -vel_MAX
		linear_velocity.x = vel_MAX
