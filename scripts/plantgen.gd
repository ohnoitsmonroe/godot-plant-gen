extends Node2D

var database = preload("res://scenes/plant_database.tscn")
var db

func _ready():
	print("Generating Plant")
	
	# Instance database
	db = database.instance()
	
	# Set growth chance
	randomize()
	var growth_chance = rand_range(0, 100)
	
	# Add Trunk
	var trunk = load(db.get_plant_part("trunks").filename).instance()
	add_child(trunk)
	
	# Add branches

	if growth_chance > 25:
		grow_branches(trunk, "branches")
		for branch in trunk.get_node("child_branches").get_children():
			if growth_chance > 75:
				grow_branches(branch, "branches")
				for b in branch.get_node("child_branches").get_children():
					grow_branches(b, "branches")
					for a in b.get_node("child_branches").get_children():
						grow_branches(a, "leaves")
					
			elif growth_chance > 50:
				grow_branches(branch, "branches")
				for b in branch.get_node("child_branches").get_children():
					grow_branches(b, "leaves")
					
			else:
				grow_branches(branch, "leaves")
	else:
		grow_branches(trunk, "leaves")

	for i in get_children():
		print(i.name)
		
func grow_branches(stem, branch_type):
	for branch in stem.get_branch_positions():
		var b = load(db.get_plant_part(branch_type).filename).instance()
		b.position = branch.position
		stem.get_node("child_branches").add_child(b)
		
#func grow_leaves(stem):
#	var poses = stem.get_branch_positions()
#	for branch in stem.get_branch_positions():
#		var l = load(db.get_node("leaves").filename).instance()
#		l.position = branch.position
#		stem.add_child(l)
		
	
	


# Restart generation
func _process(_delta):
	if Input.is_action_just_pressed("RESTART"):
		get_tree().reload_current_scene()