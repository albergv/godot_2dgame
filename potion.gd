extends Area2D


@onready var animated_sprite = $animated_sprite


var player_take_potion = false


func _ready() -> void:
	pass



func _process(_delta):
	
	take_potion()
	update_animations()
	

func update_animations():
	if not player_take_potion:
		animated_sprite.play("idle")
	else: 
		animated_sprite.play("effect")
		
	

func _on_body_entered(body):
	if body.name == "Player":
		player_take_potion = true

		
func _on_body_exited(body):
	if body.name == "Player":
		player_take_potion = false
		
				
		
func take_potion():
	if player_take_potion:
		GameManager.player_has_cure = true
		await get_tree().create_timer(0.5).timeout
		queue_free()
		
