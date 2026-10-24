extends RigidBody2D
@export_category("LINE")
@export var power := 25
@export var line : Line2D
@export var max_line := 500
var clicked_in : bool 
var end_trajectory = Vector2.ZERO

var minimum_hold := .05
var hold_time

@export var poot : Sprite2D


func _ready() -> void:
	pass

func _draw():
	##target line
	line.clear_points()
	line.add_point(Vector2.ZERO)
	line.add_point(end_trajectory)
	
	##aim line
	draw_line(Vector2.ZERO, -end_trajectory, Color.PINK,10)


func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	pass

func _physics_process(delta: float) -> void:
	if Input.is_action_just_released("click"):
		_move_body(end_trajectory)
		clicked_in = false
		queue_redraw()
		_reset_line()
	poot.position = end_trajectory

func _move_body(trajectory):
	#TODO add force
	poot.position = trajectory
	var direction: Vector2 = (trajectory - position)
	apply_central_impulse(direction * power)
	

func _reset_line():
	end_trajectory = Vector2.ZERO
	line.clear_points()

func _input(event: InputEvent) -> void:
	if !clicked_in: 
		return
		
	if event is InputEventMouseMotion:
		end_trajectory = -get_local_mouse_position()
		queue_redraw()

func _on_mover_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action("click"):
		clicked_in = true
