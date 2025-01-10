extends Node3D

@export var scene:PackedScene
@export var size:int = 3
@export var margin:float = 0.1
@export var colors:Array
@export var material:StandardMaterial3D

func _ready():
	print("ready")
	# Use load() instead of preload() if the path isn't known at compile-time.
	# var scene = preload("res://scenes/jewel.tscn").instantiate()
	# Add the node as a child of the node the script is attached to.
	# var instance = scene.instantiate()
	# add_child(instance)
	for k in range(0, size):
		for i in range(0, size):
			for j in range(0, size):
				#tipo de gema aleatorio
				var instance = scene.instantiate()
				add_child(instance)
				instance.position.x += i + (margin * i)
				instance.position.y += j + (margin * j)
				instance.position.z += k + (margin * k)
				#instance.Mesh.Material = material
				print(i, j, k)


func _process(delta):
	pass
