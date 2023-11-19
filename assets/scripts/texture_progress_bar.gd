extends Node2D

var bar_red = preload("res://assets/ui/HealthBar/barRed.png")
var bar_green = preload("res://assets/ui/HealthBar/barGreen.png")
var bar_yellow = preload("res://assets/ui/HealthBar/barYllw.png")

@onready var healthbar = $TextureProgressBar

func _ready():
	hide()
	if get_parent() and get_parent().get("max_health"):
		healthbar.max_value = get_parent().max_health

func _process(delta):
	global_rotation = 0
	
func update_healthbar(value):
	healthbar.texture_progress = bar_green
	if value < healthbar.max_value * 0.7:
		healthbar.texture_progress = bar_yellow
	if value < healthbar.max_value * 0.35:
		healthbar.texture_progress = bar_red
	if value < healthbar.max_value:
		show()
	healthbar.value = value
