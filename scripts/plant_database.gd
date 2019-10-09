extends Node2D

func get_plant_part(plant_part):
	var trunks = []
	for child in get_node(plant_part).get_children():
		trunks.append(child)
	randomize()
	var trunk = trunks[rand_range(0, trunks.size())]
	return(trunk)