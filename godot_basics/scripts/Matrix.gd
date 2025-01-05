extends Node3D

var scene:String = "./scenes/jewel.tscn"

func _ready():
	var instance = load(scene).instance()
	instance.global_position = global_position


func _process(delta):
	pass
