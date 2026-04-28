class_name JumpComponent
extends Node

@export_subgroup("Nodes")
@export var player: CharacterBody2D
@export_subgroup("Settings")
@export var jump_force: float = 400.0

func handle_jump(delta: float):
	if player.is_on_floor() and Input.is_action_just_pressed("jump"):
		# Temporary, come back to make jumps feel better
		player.velocity.y -= jump_force * 1.5
