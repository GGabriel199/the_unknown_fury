extends Node3D

var navigation_speed = 0.01
var viewport_minimum = 200
var view_resolution = Vector2()
var viewport_resolution_variance = 1152
var npc_in_range = false
@onready var theme = $AudioStreamPlayer3D

func _ready():
	view_resolution.x = ($Camera_pivot/sky_camera.size /5) * viewport_resolution_variance
	view_resolution.y = ($Camera_pivot/sky_camera.size /9) * viewport_resolution_variance
	theme.play()
	get_tree().get_root().set_size(view_resolution)

func _process(delta):
	var forward = $Camera_pivot.transform.basis.z.normalized() * navigation_speed
	
	if Input.is_key_pressed(KEY_W):
		$Camera_pivot.transform.origin += -forward
	if Input.is_key_pressed(KEY_S):
		$Camera_pivot.transform.origin += forward
	if Input.is_key_pressed(KEY_A):
		$Camera_pivot.transform.origin += forward.cross(Vector3.UP) /1.5
	if Input.is_key_pressed(KEY_D):
		$Camera_pivot.transform.origin += -forward.cross(Vector3.UP) /1.5
		
	if Input.is_action_pressed("rotate_left"):
		$Camera_pivot.rotation_degrees.y -= 1
		
	if Input.is_action_pressed("rotate_right"):
		$Camera_pivot.rotation_degrees.y += 1

func _physics_process(delta):
	if npc_in_range == true:
		if Input.is_action_just_pressed("ui_accept"):
			DialogueManager.show_example_dialogue_balloon(load("res://assets/scripts/dialogue/main.dialogue"), "startdialogue")

func _on_detection_area_body_entered(body):
	if body.has_method("npc_collide"):
		npc_in_range = true
		
func _on_detection_area_body_exited(body):
	if body.has_method("npc_collide"):
		npc_in_range = false

