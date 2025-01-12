extends Node3D

@export var scene:PackedScene
@export var size:int = 3
@export var margin:float = 0.1
@export var colors:Array
@export var material:StandardMaterial3D
@export var speed_rotation:float = 1.0
	
func _ready():
	print("ready")
	# Use load() instead of preload() if the path isn't known at compile-time.
	# var scene = preload("res://scenes/jewel.tscn").instantiate()
	# Add the node as a child of the node the script is attached to.
	# var instance = scene.instantiate()
	# add_child(instance)
	var offset:float = (size / 2) + (margin * size / 2)
	for k in range(0, size):
		for i in range(0, size):
			for j in range(0, size):
				#tipo de gema aleatorio
				var instance = scene.instantiate()
				add_child(instance)
				instance.position.x += i + (margin * i) - offset
				instance.position.y += j + (margin * j) - offset 
				instance.position.z += k + (margin * k) - offset
				#instance.Mesh.Material = material
				print(i, j, k)


func _process(delta):
	pass

# TODO: lerp para girar 90º suavemente con cada movimiento
func _input(event):
	if Input.is_action_pressed("Rotate_left"):
		rotate_y(deg_to_rad(speed_rotation * -1))
		pass
	elif Input.is_action_pressed("Rotate_right"):
		rotate_y(deg_to_rad(speed_rotation))
		pass
