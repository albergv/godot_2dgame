extends Node

var experience = 0
var gold
var has_acepted_npc_treat = false
var is_dialogue_active = false

	
func increase_experience(experience_amount):
	experience += experience_amount
