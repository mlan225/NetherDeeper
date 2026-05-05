extends Node
class_name EnemyHurtboxComponent

@export_subgroup("Nodes")
@export var enemy: CharacterBody2D
@export var enemy_hurt_area: Area2D

signal hurt_enemy(enemy, damage)

func _ready() -> void:
	add_to_group("enemy/hurtbox")
	
	if enemy_hurt_area:
		enemy_hurt_area.body_entered.connect(_on_hurt_area_entered)
	else:
		push_warning("HurtboxComponent: HurtboxComponent: No Area2D assigned to 'enemy_hurt_area'")
		
func _on_hurt_area_entered(body):
	# Only react to things that can deal damage
	#if body.has_method("get_damage"):
		#var dmg = body.get_damage()
		#emit_signal("hurt", owner, dmg)
	if(body.is_in_group("player/hitbox")):
		print("enemy hurtbox triggered!")
