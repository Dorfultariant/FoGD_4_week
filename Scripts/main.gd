extends Node

@export var levels : Array[PackedScene]
@onready var cur_lvl_node  = $CurrentLevel
var cur_lvl_idx = 0


# Called when the node enters the scene tree for the first time.
# Scene start
func _ready() -> void:
	print("Ready called")
	if levels[cur_lvl_idx]:
		cur_lvl_node = levels[cur_lvl_idx].instantiate()
		add_child(cur_lvl_node)
		cur_lvl_node.CoinsCollected.connect(change_level)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func change_level() -> void:
	# If the last level is reached, do nothing
	if levels.size() - 1 == cur_lvl_idx:
		return
	cur_lvl_node.queue_free()
	cur_lvl_idx += 1
	cur_lvl_node = levels[cur_lvl_idx].instantiate()
	add_child(cur_lvl_node)
	cur_lvl_node.CoinsCollected.connect(change_level)
	
