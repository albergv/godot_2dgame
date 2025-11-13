extends Node

var experience = 0
var gold
var has_acepted_npc_treat = false
var is_dialogue_active = false
var player_damage = 1
var pig_damage = 1
var player_is_hit = false
var player_has_cure = false

	
func increase_experience(experience_amount):
	experience += experience_amount
