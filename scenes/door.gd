extends Area2D

@onready var player = $"../Player"
@export var next_scene_path: String
@export var number_door: String

var is_player_on_door = false


func _ready():
	if GameManager.is_changed_scene2:
		player.position.x = NavControl.lvl1_doorposition_x
		player.position.y = NavControl.lvl1_doorposition_y
		GameManager.is_changed_scene2 = false
		
	if GameManager.is_changed_scene4:
		player.position.x = NavControl.lvl2_doorposition_x
		player.position.y = NavControl.lvl2_doorposition_y
		GameManager.is_changed_scene4 = false
		
	
	pass


func _process(_delta):
	if number_door == "1" and is_player_on_door and GameManager.has_acepted_npc_treat:
		change_scene()
		GameManager.is_changed_scene = true
		
	if number_door == "2" and is_player_on_door and GameManager.player_has_cure:
		change_scene2()
		GameManager.is_changed_scene2 = true
		
	if number_door == "3" and is_player_on_door and GameManager.green_bottle_given:
		change_scene3()
		GameManager.is_changed_scene3 = true
		
		
	if number_door == "4" and is_player_on_door and GameManager.green_bottle_given:
		change_scene4()
		GameManager.is_changed_scene4 = true
	
	pass
	
	
	

func _on_body_entered(body):
	if body.name == "Player":
		is_player_on_door = true
		
func _on_body_exited(body):
	if body.name == "Player":
		is_player_on_door = false
				
		
func change_scene():
	get_tree().change_scene_to_file(next_scene_path)
	#GameManager.has_acepted_npc_treat = false
	#GameManager.player_has_cure = false
	#GameManager.green_bottle_given = false
	
func change_scene2():
	get_tree().change_scene_to_file(next_scene_path)
	#GameManager.has_acepted_npc_treat = true
	#GameManager.player_has_cure = false
	#GameManager.green_bottle_given = false
	
	
func change_scene3():
	get_tree().change_scene_to_file(next_scene_path)
	#GameManager.has_acepted_npc_treat = true
	#GameManager.player_has_cure = false
	#GameManager.green_bottle_given = false

func change_scene4():
	get_tree().change_scene_to_file(next_scene_path)
	#GameManager.has_acepted_npc_treat = true
	#GameManager.player_has_cure = false
	#GameManager.green_bottle_given = false
