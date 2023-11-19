extends Node2D

var select = preload  ("res://assets/sfx/Selected.mp3")
var back = preload  ("res://assets/sfx/Back.mp3")
var select_fail = preload  ("res://assets/sfx/SelectFail.mp3")
var sung_hit = preload  ("res://assets/sfx/ReceiveDamageSung.wav")
var attack
var up_down

func _process(delta):
	if Input.is_action_just_pressed("ui_select"):
		$Select.play()
	if Input.is_action_just_pressed("ui_redo"):
		$Back.play()
	if Input.is_action_just_pressed("ui_up"):
		$Up_Down.play()
	if Input.is_action_just_pressed("ui_down"):
		$Up_Down.play()
