class_name MovementComponent
extends Node

@export_subgroup("Nodes")
@export var body: CharacterBody2D
@export_subgroup("Settings")
@export var speed: float = 200.0

var _direction: float

func _ready() -> void:
	_direction = 1

func handle_movement(delta: float):
		var input_direction: float = Input.get_axis("left", "right")
		#Constant movement either left or right
		if input_direction == 1.0 or input_direction == -1.0:
			_direction = input_direction
			
		body.velocity.x = _direction * speed
