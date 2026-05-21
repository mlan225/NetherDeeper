extends CharacterBody2D

#Components
#Use onready when the component is garaunteed to be on the node
@onready var gravity_component = $GravityComponent
@onready var movement_component = $MovementComponent
@onready var jump_component = $JumpComponent
@onready var player_health_component = $PlayerHealthComponent

func _ready() -> void:
	player_health_component.player_death.connect(_on_player_death)

func _physics_process(delta):
	gravity_component.apply_gravity(delta)
	movement_component.handle_movement(delta)
	jump_component.handle_jump(delta)
	
	move_and_slide()

func _on_player_death() -> void:
	kill_player()
	
func kill_player() -> void:
	queue_free()
