extends Node2D

class_name Level

var coins

@onready var spikes 
signal CoinsCollected()

var level_complete : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if not level_complete:
		if $Coins:
			coins = $Coins.get_children()
			if len(coins) <= 0:
				CoinsCollected.emit()
				level_complete = true
