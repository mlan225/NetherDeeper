extends CharacterBody2D

@onready var gravityComponent = $GravityComponent

@export var speed:float = 100

var direction: int

var _is_rising: bool = true
var _rising_start_y_coord: float
var _rising_stop_y_coord: float

signal has_died

func _ready() -> void:
	add_to_group("enemy")
	#Generate either 0 or 1 and then * 2 -1 to get either -1 or 1
	direction = randi_range(0, 1) * 2 - 1
	RiseFromGround()
	
func _physics_process(delta: float) -> void:
	#Slime movement if not rising
	if not _is_rising:
		gravityComponent.apply_gravity(delta)
		velocity.x = direction * speed	
	
	#may want to handle the move and slide differently so it does not run when not needed
	move_and_slide()

func RiseFromGround() -> void:
	var tween := create_tween()
	tween.tween_property(self, "position:y", position.y - 140, 2.0)
	tween.finished.connect(_on_rise_complete)

func _on_rise_complete() -> void:
	_is_rising = false

func Die() -> void:
	has_died.emit()
	queue_free()
