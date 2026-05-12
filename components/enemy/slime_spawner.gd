class_name SlimeSpawner
extends Node

@export_category("Settings")
@export_group("Enemy")
@export var slime_scene: PackedScene
@export_group("SpawnBounds")
@export var left_boundry: Area2D
@export var right_boundry: Area2D
#Slime will begin rising after spawn, only moves once reaching end of rise
@export var scene_floor: StaticBody2D
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
	SpawnSlime()
	
func SpawnSlime() -> void:
	if current_spawn_count < max_spawn_count:
		#increment the slime spawn count
		current_spawn_count += 1

		var slime: CharacterBody2D = slime_scene.instantiate()
		#adding padding to the boundary x values to prevent spawning on them
		var slime_spawn_pos_x: float = randi_range(left_boundry.global_position.x + 50, right_boundry.global_position.x - 50)
		slime.position = Vector2(slime_spawn_pos_x, scene_floor.global_position.y + 100)
		
		slime.has_died.connect(_on_slime_died)
		
		get_tree().current_scene.add_child(slime)

func _on_slime_died() -> void:
	current_spawn_count -= 1
