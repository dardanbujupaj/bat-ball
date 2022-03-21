extends KinematicBody2D


const ACCELERATION = 100
const MAX_SPEED = 300

const HIT_RANGE = 100
const HIT_STRENGTH = 500


var velocity: Vector2

onready var hit_ray = $RayCast2D
onready var hit_area = $HitArea


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action("hit"):
		handle_hit()



func _physics_process(delta: float) -> void:
	
	hit_ray.cast_to = get_local_mouse_position().normalized() * HIT_RANGE
	hit_area.rotation = get_local_mouse_position().angle()
	
	var movement_input = Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	)
	
	velocity = velocity.linear_interpolate(movement_input * MAX_SPEED, 10 * delta)
	
	
	move_and_slide(velocity)
	

func handle_hit() -> void:
	
	for object in hit_area.get_overlapping_bodies():
		if object is RigidBody2D:
			object.linear_velocity = get_local_mouse_position().normalized() * HIT_STRENGTH
	
