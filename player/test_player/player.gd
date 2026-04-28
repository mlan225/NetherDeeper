extends CharacterBody2D

#Components
@onready var gravity_component = $GravityComponent
@onready var movement_component = $MovementComponent
@onready var jump_component = $JumpComponent

func _physics_process(delta):
	gravity_component.apply_gravity(delta)
	movement_component.handle_movement(delta)
	jump_component.handle_jump(delta)
	
	move_and_slide()
