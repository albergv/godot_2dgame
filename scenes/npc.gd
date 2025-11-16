extends Area2D

@onready var interrogation_mark = $interrogationmark
const my_dialogue = preload("res://dialogues/first_dialogue.dialogue")

var is_player_close = false


func _ready():
	DialogueManager.dialogue_started.connect(_on_dialogue_started)
	DialogueManager.dialogue_ended.connect(_on_dialogue_ended)

func _process(_delta):
	if is_player_close and Input.is_action_just_pressed("action_1") and not GameManager.is_dialogue_active:
		DialogueManager.show_dialogue_balloon(my_dialogue, "start")

func _on_area_entered(_area):
	interrogation_mark.visible = true
	is_player_close = true
	
func _on_area_exited(_area):
	interrogation_mark.visible = false
	is_player_close = false
	
func _on_dialogue_started(_dialogue):
	GameManager.is_dialogue_active = true
	
func _on_dialogue_ended(_dialogue):
	await get_tree().create_timer(0.2).timeout
	GameManager.is_dialogue_active = false
	
