extends Area2D


@export var next_scene_path: String
var is_player_on_door = false


func _process(_delta):
	if is_player_on_door and GameManager.has_acepted_npc_treat:
		change_scene()
		
	if is_player_on_door and GameManager.player_has_cure:
		change_scene2()
	
	pass
	
	
	

func _on_body_entered(body):
	if body.name == "Player":
		is_player_on_door = true
		
func _on_body_exited(body):
	if body.name == "Player":
		is_player_on_door = false
				
		
func change_scene():
	get_tree().change_scene_to_file(next_scene_path)
	GameManager.has_acepted_npc_treat = false
	
func change_scene2():
	get_tree().change_scene_to_file(next_scene_path)
	GameManager.player_has_cure = false
