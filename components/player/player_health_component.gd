class_name PlayerHealthComponent
extends Node

@export_category("Settings")
#DEVNOTE: May need to make this a float to do defense stat logic
@export var max_health: int = 3
#DEVNOTE: May need to make this a float to do defense stat logic
@export var current_health: int 

@export_category("Nodes")

@onready var HealthUi = get_tree().get_first_node_in_group("healthUi")

signal player_death

func _ready() -> void:
	add_to_group("playerHealth")
	current_health = max_health
	HealthUi.set_health.emit(current_health, max_health)
	
func take_damage(damage_ammount: int) -> void:
	#max() will return the highest number argument
	current_health = max(current_health - damage_ammount, 0)
	HealthUi.set_health.emit(current_health, max_health)
	if current_health == 0:
		has_died()
	
func has_died() -> void:
	#TODO: Call Dead signal from a level manager
	player_death.emit()

func get_min_max_health() -> Dictionary:
	return {
		"current_health": current_health,
		"max_health": max_health
	}
