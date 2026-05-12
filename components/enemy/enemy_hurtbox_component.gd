extends Node
class_name EnemyHurtboxComponent

@export_subgroup("Nodes")
@export var enemy: CharacterBody2D
@export var enemy_hurt_area: Area2D

func _ready() -> void:
	
	if enemy_hurt_area:
		enemy_hurt_area.area_entered.connect(_on_hurt_area_entered)
	else:
		push_warning("HurtboxComponent: HurtboxComponent: No Area2D assigned to 'enemy_hurt_area'")
		
func _on_hurt_area_entered(area: Area2D):
	if area.is_in_group("player/hitbox"):
		enemy.Die()
