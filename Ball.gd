extends RigidBody2D


onready var hit_sound = $AudioStreamPlayer2D

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	apply_central_impulse(Vector2(500, 500))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_Ball_body_entered(body: Node) -> void:
	hit_sound.play()
