extends Node2D

func _ready():
	z_index += 1
	var children = []
	for child in get_children():
		children.append(child)
	
	randomize()
	var leaf = children[rand_range(0, get_child_count() - 1)]
	leaf.visible = true
	

