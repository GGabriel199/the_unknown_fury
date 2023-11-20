extends Node3D

var navigation_speed = 0.01
var viewport_minimum = 200
var view_resolution = Vector2()
var viewport_resolution_variance = 1920

func _ready():
	view_resolution.x = ($Camera_pivot/sky_camera.size /54) * viewport_resolution_variance
	view_resolution.y = ($Camera_pivot/sky_camera.size /96) * viewport_resolution_variance
	
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

func _input(event):
	if Input.is_action_just_pressed("zoom_in"):
		if $Camera_pivot/sky_camera.size > 5:
			$Camera_pivot/sky_camera.size -= 1
			navigation_speed = $Camera_pivot/sky_camera.size / 100
			print(navigation_speed)
			
			_adjust_viewport_sized()
			
	if Input.is_action_just_pressed("zoom_out"):
		if $Camera_pivot/sky_camera.size < 100:
			$Camera_pivot/sky_camera.size += 1
			navigation_speed = $Camera_pivot/sky_camera.size / 100
			print(navigation_speed)
			
			_adjust_viewport_sized()

func _adjust_viewport_sized():
	view_resolution.x = ($Camera_pivot/sky_camera.size /54) * viewport_resolution_variance
	view_resolution.y = ($Camera_pivot/sky_camera.size /96) * viewport_resolution_variance
	
	print (Vector2(view_resolution.x, view_resolution.y))
	
	get_tree().get_root().set_size(Vector2(view_resolution.x, view_resolution.y))