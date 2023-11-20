extends Node3D

class_name EnemyStats
var enemies: Array = [GOO]
var action_queue: Array = []
var is_battling: bool = false
var index: int = 0
signal next_player
@onready var choice = $"../../choice"
@onready var magic = $"../../magicchoice"
@onready var item = $"../../ItemChoice"
var characters: Array = []
static var is_dead: bool

func _ready():
	enemies = get_children()
	for i in enemies.size():
		enemies[i].position = Vector3(i*-.2, 0, i*.8)
	show_choice()
	characters = get_children()
	
func _process(delta):
	if not choice.visible:
		if Input.is_action_just_pressed("ui_up"):
			if index > 0:
				index -=1
				switch_focus(index, index+1)
				
		if Input.is_action_just_pressed("ui_down"):
			if index < enemies.size() - 1:
				index +=1
				switch_focus(index, index-1)
				
		if Input.is_action_just_pressed("ui_accept"):
			action_queue.push_back(index)
			emit_signal("next_player")
			
	if action_queue.size() == enemies.size() and not is_battling and is_dead == false:
		is_battling = true
		for goo in characters:
			remove_child(goo)
			print("Enemy Neutralized")
		_action(action_queue)
		
func _action(stack):
	for i in stack:
		enemies[i].take_damage(1)
		await get_tree().create_timer(1).timeout
	action_queue.clear()
	is_battling = false
	show_choice()
	
func switch_focus(x,y):
	enemies[x].focus()
	enemies[y].unfocus()

func show_choice():
	choice.show()
	choice.find_child("Attack").grab_focus()
	choice.find_child("Magic").grab_focus()
	choice.find_child("Item").grab_focus()
	choice.find_child("Defend").grab_focus()

func _on_enemies_defeated():
	if enemies == null:
		get_tree().change_scene_to_file("res://assets/scenes/world.tscn")

func show_magic():
	choice.show()
	
func _reset_focus():
	index = 0
	for enemy in enemies:
		enemy.unfocus()

func _start_choosing():
	_reset_focus()
	enemies[0].focus()

func _on_attack_pressed():
	choice.hide()
	_start_choosing()

func _on_magic_pressed():
	choice.hide()
	magic.show()

func _on_item_pressed():
	choice.hide()
	item.show()

func _on_defend_pressed():
	choice.hide()

func _on_run_pressed():
	get_tree().change_scene_to_file("res://assets/scenes/world.tscn")
