extends Resource

class_name SUNG

@export var name: String
@export var health: int
@export var attack: int
@export var magic: int
@export var defense: int
@export var speed: int
@export var experience: int
var experience_value: int
var next_experience: int = 20
var level: int
var level_up: bool

func ready():
	experience_value = health + attack + magic + defense + speed
	ResourceLoader.load("res://assets/scripts/repo/SUNG.tres")

func _process(delta):
	if experience == next_experience:
		level_increase()
		
func save_stats():
	pass
	
func level_increase():
	if level_up == true:
		health += health * 1.2
		attack += attack * 1.2
		magic += magic * 1.2
		defense += defense * 1.2
		speed += speed * 1.2
		next_experience * 1.2
