extends Node3D

@export var scene:PackedScene
@export var size:float = 4
@export var margin:float = 0.1
@export var colors:Array
@export var material:StandardMaterial3D
@export var speed_rotation:float = 1.0
var rotating:bool = false
var rotate_dir = 0
var ini_x 
var ini_y 
var ini_z
var end_x
var end_y
var end_z
var elapsed: float = 0
	
func _ready():
	print("ready")
	end_y = rotation.y
	end_x = rotation.x
	end_z = rotation.z
	# Use load() instead of preload() if the path isn't known at compile-time.
	# var scene = preload("res://scenes/jewel.tscn").instantiate()
	# Add the node as a child of the node the script is attached to.
	# var instance = scene.instantiate()
	# add_child(instance)
	var offset:float = size/2 #(size + (margin * (size - 1))) / 2
	print(offset)
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
				#print(i, j, k)


func _process(delta):
	if rotating == true:
		rotation.y = lerp_angle(rotation.y, end_y, elapsed)
		rotation.x = lerp_angle(rotation.x, end_x, elapsed)
		elapsed += delta
		#print("rotando ", rotation.y, " ", elapsed)
		if abs(rotation.y - end_y) < 0.001 and abs(rotation.x - end_x) < 0.001:
			#print("fin rotacion abs")
			rotation.y = end_y
			rotation.x = end_x
			rotating = false
			rotate_dir = 0
			elapsed = 0


func _input(event):
	if Input.is_action_just_pressed("Rotate_left") and rotating == false:
		ini_y = rotation.y
		rotating = true
		rotate_dir = -1
		end_y = ini_y + deg_to_rad(90 * rotate_dir)
		#print("rotar", rotate_dir, end_y)
		#rotate_y(deg_to_rad(speed_rotation * -1))
		#rotating = false
	elif Input.is_action_just_pressed("Rotate_right") and rotating == false:
		ini_y = rotation.y
		rotating = true
		rotate_dir = 1
		end_y = ini_y + deg_to_rad(90 * rotate_dir)
		#print("rotar ", rotate_dir, " ", end_y)
		#rotate_y(deg_to_rad(speed_rotation))
		#rotating = false
	elif Input.is_action_just_pressed("Rotate_up") and rotating == false:
		ini_x = rotation.x
		rotating = true
		rotate_dir = -1
		end_x = ini_x + deg_to_rad(90 * rotate_dir)
	elif Input.is_action_just_pressed("Rotate_down") and rotating == false:
		ini_x = rotation.x
		rotating = true
		rotate_dir = 1
		end_x = ini_x + deg_to_rad(90 * rotate_dir)
