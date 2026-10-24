extends Node2D

@export var grab_full : bool 
@export var grab_point : PinJoint2D
var viable_body 
var clicked


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = get_global_mouse_position() #match mouse position
	if(Input.is_action_just_pressed("click")):
		if(viable_body != null && !clicked):
			clicked = true
			grab_point.node_b = viable_body.get_path()
	if(Input.is_action_just_released("click")):
		clicked = false
			
func _on_body_entered(body: Node2D) -> void:
	if(body.is_in_group("Body")):
		viable_body = body
		print(viable_body)

func _on_body_exited(body: Node2D) -> void:
	if body == viable_body:
		viable_body = null
