extends CharacterBody2D


@export var move_speed: float
@export var jump_speed: float
@export var stats: Stats

@onready var animated_sprite = $animatedSprite

var is_facing_right = true
var player_hit = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _ready() -> void:
	stats = stats.duplicate()
	stats.no_health.connect(get_tree().reload_current_scene)

func _physics_process(delta):
	if GameManager.is_dialogue_active:
		return
	
	take_hit()
	jump(delta)	
	move_x()
	flip()
	update_animations()
	move_and_slide()
	

func take_hit():
	if GameManager.player_is_hit:
		player_hit = true
		await get_tree().create_timer(0.7).timeout
		#stats.health -= GameManager.pig_damage
		player_hit = false
		GameManager.player_is_hit = false
	
	
func update_animations():
	if not is_on_floor():
		if velocity.y < 0:
			animated_sprite.play("jump")
		else:
			animated_sprite.play("fall")
		return
	
	if velocity.x:
		animated_sprite.play("run")
	else:
		animated_sprite.play("idle")
		
	if player_hit:
		animated_sprite.play("hit")


func jump(delta):
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_speed
		
	if not is_on_floor():
		velocity.y += gravity * delta
	
func flip():
		if (is_facing_right and velocity.x < 0) or (not is_facing_right and velocity.x > 0):
			scale.x *= -1
			is_facing_right = not is_facing_right

func move_x():
	var input_axis = Input.get_axis("move_left","move_right")
	velocity.x = input_axis * move_speed
	
	
