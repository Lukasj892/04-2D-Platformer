extends Node

onready var SM = get_parent()
onready var player = get_node("../..")

func _ready():
	yield(player, "ready")
	
func start():
	player.set_animation("Attacking")
	player.move_speed *= 1.5 #Increases player speed when attacking.

func physics_process(_delta):
	if not player.is_on_floor():
		SM.set_state("Falling")
	else:
		player.velocity.y = 0
	
	if player.is_moving():
		player.velocity += player.move_speed * player.move_vector()
		player.move_and_slide(player.velocity, Vector2.UP)
	else:
		player.velocity = Vector2.ZERO
		SM.set_state("Idle")




func DoDamage():
	pass


func _on_AnimatedSprite_animation_finished():
	SM.set_state("Moving")
