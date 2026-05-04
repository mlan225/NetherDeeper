extends CharacterBody2D

@onready var gravityComponent = $GravityComponent

@export var speed:float = 100

var direction: int

func _ready() -> void:
	add_to_group("enemy")
	#Generate either 0 or 1 and then * 2 -1 to get either -1 or 1
	direction = randi_range(0, 1) * 2 - 1
	
func _physics_process(delta: float) -> void:
	gravityComponent.apply_gravity(delta)
	velocity.x = direction * speed
	
	move_and_slide()
