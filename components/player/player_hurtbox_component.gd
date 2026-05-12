class_name PlayerHurtBoxComponent
extends Node

@export_group("Nodes")
@export var player: CharacterBody2D
@export var player_hurt_area: Area2D

func _ready() -> void:
	if player_hurt_area:
		player_hurt_area.area_entered.connect(_on_hurt_area_entered)
	else:
		push_warning("HurtboxComponent: HurtboxComponent: No Area2D assigned to 'player_hurt_area'")
		
func _on_hurt_area_entered(area: Area2D):
	if area.is_in_group("enemy/hitbox"):
		print("player has been hit! [Player weapon hurtbox is temporarily disabled for testing]")
