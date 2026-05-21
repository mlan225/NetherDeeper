class_name PlayerHealthComponent
extends Node

@export_category("Settings")
#DEVNOTE: May need to make this a float to do defense stat logic
@export var max_health: int = 100
#DEVNOTE: May need to make this a float to do defense stat logic
@export var current_health: int 

@export_category("Nodes")

signal player_death

func _ready() -> void:
	current_health = max_health
	
func take_damage(damage_ammount: int) -> void:
	#max() will return the highest number argument
	current_health = max(current_health - damage_ammount, 0)
	if current_health == 0:
		has_died()
	
func has_died() -> void:
	# Call Dead signal from a level manager
	print("Player has died")
	player_death.emit()
