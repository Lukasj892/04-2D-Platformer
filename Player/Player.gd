extends KinematicBody2D

onready var SM = $StateMachine
onready var VP = get_viewport_rect()

var velocity = Vector2.ZERO
var jump_power = Vector2.ZERO
var direction = 1

export var gravity = Vector2(0,30)

export var move_speed = 5
export var max_move = 300

export var jump_speed = 100
export var max_jump = 1000

export var leap_speed = 100
export var max_leap = 1000

var moving = false
var is_jumping = false


func _ready():
	pass


func _physics_process(_delta):
	velocity.x = clamp(velocity.x,-max_move,max_move)
	
	if position.y > Global.death_zone:
		get_tree().reload_current_scene()
	
	if Input.is_action_just_pressed("attack") and is_on_floor():
		SM.set_state("Attacking")
		
	
	if SM.state_name == "Attacking":
		$DetectEnemy/CollisionShape2D.disabled = false
	else:
		$DetectEnemy/CollisionShape2D.disabled = true

func is_moving():
	return true

func move_vector():
	return Vector2(move_speed ,1.0)

func _unhandled_input(_event):
	pass

func set_animation(anim):
	if $AnimatedSprite.animation == anim: return
	if $AnimatedSprite.frames.has_animation(anim): $AnimatedSprite.play(anim)
	else: $AnimatedSprite.play()

func die():
	queue_free()
