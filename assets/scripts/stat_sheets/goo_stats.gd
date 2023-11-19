extends Resource

class_name GOO

@export var name: String
@export var health: int
@export var attack: int
@export var magic: int
@export var defense: int
@export var speed: int
@export var experience: int

@export var experience_value: int

func ready():
	experience_value = health + attack + magic + defense + speed
