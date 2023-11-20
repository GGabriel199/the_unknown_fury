extends Area3D

var character_name : String = "Goo"
var lvl : int = 4

func _ready():
	pass


func _on_body_entered(body):
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://assets/scenes/battle_scene.tscn")
