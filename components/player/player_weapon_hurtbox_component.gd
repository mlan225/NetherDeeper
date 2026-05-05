extends Node
class_name PlayerWeaponHurtboxComponent

@export_subgroup("Nodes")
@export var hitbox: Area2D

func _ready() -> void:
	if hitbox != null:
		hitbox.add_to_group("player/hitbox")
