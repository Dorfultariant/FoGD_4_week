extends Node2D

class_name Level

@onready var coins = $Coins.get_children()
signal CoinsCollected()

var level_complete : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not level_complete:
		coins = $Coins.get_children()
		if len(coins) <= 0:
			CoinsCollected.emit()
			level_complete = true
