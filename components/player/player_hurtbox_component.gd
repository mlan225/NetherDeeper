class_name PlayerHurtBoxComponent
extends Node

@export_group("Nodes")
@export var player: CharacterBody2D
@export var player_hurt_area: Area2D
#DEVNOTE: temporary player character model until a sprite is implimented
@export var color_rect = ColorRect
@export var player_health_component: PlayerHealthComponent

#DEVNOTE: Temporary color rect for player. Will replace with sprite
var _color_rect_original_color: Color
var _is_hurt: bool = false

func _ready() -> void:
	_color_rect_original_color = color_rect.color
	
	if player_hurt_area:
		player_hurt_area.area_entered.connect(_on_hurt_area_entered)
	else:
		push_warning("HurtboxComponent: HurtboxComponent: No Area2D assigned to 'player_hurt_area'")
		
func _on_hurt_area_entered(area: Area2D):
	if not _is_hurt:
		if area.is_in_group("enemy/hitbox"):
			#DEVNOTE: will be adding arguments for amount of damage to be taken
			take_damage()

#DEVNOTE: Damage to take will be set later for different sources
func take_damage(damage_to_take:int = 0):
	#DEVNOTE: Temporarily setting damage to take until enemy has damage numbers to give
	player_health_component.take_damage(10)
	#DEVNOTE: Temporary for now until it is replaced with sprite
	color_rect.color = Color.RED
	_is_hurt = true
	player_hurt_area.set_deferred("monitoring", false)
	await get_tree().create_timer(0.5).timeout
	_is_hurt = false
	player_hurt_area.set_deferred("monitoring", true)
	color_rect.color = _color_rect_original_color
