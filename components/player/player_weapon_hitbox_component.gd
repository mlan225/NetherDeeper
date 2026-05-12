extends Node
class_name PlayerWeaponHitboxComponent

@export_group("Nodes")
@export var hitbox: Area2D

func _ready() -> void:
	if hitbox != null:
		hitbox.add_to_group("player/hitbox")
