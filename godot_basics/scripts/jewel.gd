extends Node3D

#@onready var mesh:MeshInstance3D = $MeshInstance3D
var jewel_type: int = 0
var mesh:MeshInstance3D

# Called when the node enters the scene tree for the first time.
func _ready():
	mesh = $MeshInstance3D
	print(jewel_type)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
