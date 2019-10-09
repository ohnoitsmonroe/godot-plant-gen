# godot-plant-gen
A simple plant generator for godot

When running game press escape to generate a new plant

The basic overview is that each plant is made up of trunk, branch, and leaf nodes, which are just a sprite node and some Position2Ds
that are placed at the end of the branch sprite, and will designate where the next branch or leaf will be placed. The trunk is
added, then branches or leaves are added to the trunk, then more branches and leaves added upon those. I also use a really ugly solution
to decide on how many cycles of adding branches there get to be, but this could definitely be made into a more elegant function in the 
future.

This is also my first github project, and hopefully you find something useful!
