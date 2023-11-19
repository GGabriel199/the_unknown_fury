extends VBoxContainer

var stats = AllPlayers.new()

func _ready():
	$Name.text = stats.sung.name
	$Attack.text = str(stats.sung.attack)
	$Magic.text = str(stats.sung.magic)
	$Defense.text = str(stats.sung.defense)
	$Speed.text = str(stats.sung.speed)
	$Nxt_exp.text = str(stats.sung.next_experience)
