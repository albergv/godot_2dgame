extends CharacterBody2D


@export var move_speed: float
@export var jump_speed: float
@onready var animated_sprite2D = $AnimatedSprite2D
@onready var area2d = $Area2D

var is_facing_right = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	
	
	movey(delta)
	movex()
	flip()
	update_animations()
	move_and_slide()
	

	
func update_animations():
	if not is_on_floor():
		if velocity.y < 0:
			animated_sprite2D.play("jump")
		else:
			animated_sprite2D.play("fall")
		return
	
	if velocity.x:
		animated_sprite2D.play("run")
	else:
		animated_sprite2D.play("idle")
		
		
func flip():
		if (is_facing_right and velocity.x < 0) or (not is_facing_right and velocity.x > 0):
			scale.x *= -1
			is_facing_right = not is_facing_right
			
func movey(delta):
	velocity.y += gravity * delta
		
func movex():
	velocity.x = -move_speed




func _on_area_2d_body_entered(body):
	if body.name == "Player":
		var y_delta = position.y - body.position.y
		if y_delta > 10:
			queue_free()
			body.jump(body)
		else:
			body.queue_free()
