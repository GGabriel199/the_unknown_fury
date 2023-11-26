extends CanvasLayer

@onready var button_press = $ButtonPress
@onready var panel = $Panel/VBoxContainer
@onready var animation = $Panel/AnimationPlayer

func _ready():
	$Panel/PressEnter.show()
	panel.hide()

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		_on_press_any_button_pressed()
		
func _on_start_pressed():
	button_press.play()
	animation.play("fade out")
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://assets/scenes/world.tscn")


func _on_load_pressed():
	button_press.play()


func _on_options_pressed():
	button_press.play()


func _on_press_any_button_pressed():
	button_press.play()
	animation.play("fade in")
	panel.show()
	$Panel/PressEnter.hide()
