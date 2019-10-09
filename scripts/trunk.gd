extends Node2D

func _ready():
	z_index += 1

func get_branch_positions():
	var poses = []
	for child in $branches.get_children():
		poses.append(child)
	return poses