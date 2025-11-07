extends Area2D


@export var next_scene_path: String
var is_player_on_door = false


func _process(_delta):
	if is_player_on_door and GameManager.has_acepted_npc_treat:
		change_scene()
	
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
