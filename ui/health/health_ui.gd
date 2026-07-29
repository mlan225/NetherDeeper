extends Control

signal set_health(value, max)

@export var heart_scene: PackedScene
#DEVNOTE: Max health will be determined by stats, set to temp value for now

@onready var hearts := $Hearts

func _ready():
	#wait for tree to finish processing
	await get_tree().process_frame
	
	var playerHealthComponent := get_tree().get_first_node_in_group("playerHealth")
	var healthState: Dictionary = playerHealthComponent.get_min_max_health()
	
	rebuild_hearts(healthState.max_health)
	set_health.connect(_on_set_health)

func rebuild_hearts(max_health):
	# Remove all existing hearts
	for child in hearts.get_children():
		child.queue_free()

	# Add hearts based on max_health
	for i in range(max_health):
		var heart = heart_scene.instantiate()
		hearts.add_child(heart)

func _on_set_health(value: int, max: int):
	# Show/hide hearts based on current health
	for i in range(hearts.get_child_count()):
		hearts.get_child(i).visible = i < value
