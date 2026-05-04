class_name EnemyBoundryComponent
extends Node

@export_subgroup("Nodes")
@export var left_boundary:Area2D
@export var right_boundary:Area2D

func _ready():
	if left_boundary:
		left_boundary.body_entered.connect(_on_left_boundary_entered)
	if right_boundary:
		right_boundary.body_entered.connect(_on_right_boundary_entered)
	
#Left boundary signal
func _on_left_boundary_entered(body: CharacterBody2D):
	if body.is_in_group("enemy"):
		body.direction = 1
		print("hit the left boundary")

#Right boundary signal
func _on_right_boundary_entered(body: CharacterBody2D):
	if body.is_in_group("enemy"):
		body.direction = -1
		print("hit the left boundary")
