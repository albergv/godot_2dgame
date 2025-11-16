extends Node

#Called GameManager.



var experience = 0
var gold
var has_acepted_npc_treat = false
var is_dialogue_active = false
var player_damage = 1
var pig_damage = 1
var player_is_hit = false
var player_has_cure = false
var green_bottle_given = false

var is_changed_scene = false
var is_changed_scene2 = false
var is_changed_scene3 = false
var is_changed_scene4 = false


func increase_experience(experience_amount):
	experience += experience_amount
