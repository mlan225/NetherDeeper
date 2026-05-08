class_name SlimeSpawner
extends Node

@export_category("Settings")
@export_group("Enemy")
@export var slime: PackedScene
@export_group("SpawnBounds")
@export var left_bound: Node2D
@export var right_bound: Node2D
@export_group("Spawner Settings")
@export var max_spawn_count: int = 10
@export var respawn_time: float = 0.9
@export var current_spawn_count: int = 0
@export var spawner_active: bool = false

var slime_spawn_timer: Timer

func _ready() -> void:
	#Create timer
	slime_spawn_timer = Timer.new()
	slime_spawn_timer.name = "SlimeSpawnTimer"
	add_child(slime_spawn_timer)
	
	#configure timer
	slime_spawn_timer.wait_time = 0.5
	slime_spawn_timer.one_shot = false
	
	#connect signal to a function
	slime_spawn_timer.timeout.connect(_on_spawn_timer_timeout)

func StartSpawner() -> void:
	slime_spawn_timer.start()
	spawner_active = true

func StopSpawner() -> void:
	slime_spawn_timer.stop()

func _on_spawn_timer_timeout():
	print("0.5 seconds passed! Restarting...")
	
