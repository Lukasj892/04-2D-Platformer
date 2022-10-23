extends KinematicBody2D

onready var SM = $StateMachine
onready var VP = get_viewport_rect()

var velocity = Vector2.ZERO
var jump_power = Vector2(0,1)
var direction = 1

export var gravity = Vector2(0,30)

export var move_speed = 20
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
		queue_free()
	
	if Input.is_action_just_pressed("attack") and is_on_floor():
		SM.set_state("Attacking")

func is_moving():
	return true

func move_vector():
	return Vector2(1.0 ,1.0)
	pass

func _unhandled_input(_event):
	pass

func set_animation(anim):
	if $AnimatedSprite.animation == anim: return
	if $AnimatedSprite.frames.has_animation(anim): $AnimatedSprite.play(anim)
	else: $AnimatedSprite.play()

func die():
	queue_free()
