class_name SpawnManagerComponent
extends Node

@export_category("Nodes")
@export var slime_spawner: SlimeSpawner

@export_subgroup("Settings")
@export var max_enemy_count: int = 10
@export var can_spawn_enemies = true

func _process(delta: float) -> void:
	if not slime_spawner.spawner_active:
		slime_spawner.StartSpawner()
