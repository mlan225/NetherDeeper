class_name GravityComponent
extends Node

@export_subgroup("Nodes")
@export var player: CharacterBody2D
@export_subgroup("Settings")
@export var gravity:float = 980.0

func apply_gravity(delta):
	# Apply gravity if not on the floor
	if not player.is_on_floor():
		# Temporary, but makes fall feel heavier
		player.velocity.y += gravity * 1.5 * delta
