class_name EnemyHitboxComponent
extends Node

@export_group("Nodes")
@export var hitbox: Area2D

func _ready() -> void:
	if hitbox != null:
		hitbox.add_to_group("enemy/hitbox")
