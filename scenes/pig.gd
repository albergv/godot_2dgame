extends CharacterBody2D


@export var move_speed: float
@export var jump_speed: float
@export var stats: Stats

@onready var animated_sprite2D = $AnimatedSprite2D
@onready var area2d = $Area2D
@onready var animated_sprite = $animatedSprite

const friction = 500

var is_facing_right = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var pig_hit = false


func _ready() -> void:
	stats = stats.duplicate()
	stats.no_health.connect(queue_free)

func _physics_process(delta):
	
	jump(delta)
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
		
	if pig_hit:
		animated_sprite2D.play("hit")
		
		
func flip():
		if (is_facing_right and velocity.x < 0) or (not is_facing_right and velocity.x > 0):
			scale.x *= -1
			is_facing_right = not is_facing_right
			
func movey(delta):
	velocity.y += gravity * delta
		
func movex():
	velocity.x = -move_speed
	
func jump(delta):
	if  is_on_floor():
		await get_tree().create_timer(0.4).timeout
		velocity.y = -jump_speed
		
	if not is_on_floor():
		velocity.y += gravity * delta




func _on_area_2d_body_entered(body):
	if body.name == "Player":
		var y_delta = position.y - body.position.y
		if y_delta > 10:
			pig_hit = true
			await get_tree().create_timer(0.7).timeout
			stats.health -= GameManager.player_damage
			pig_hit = false
			#body.jump(body)
			#queue_free()
			
		else:
			GameManager.player_is_hit = true
			body.stats.health -= GameManager.pig_damage
