extends Node

onready var SM = get_parent()
onready var player = get_node("../..")

func _ready():
	yield(player, "ready")
	
func start():
	player.set_animation("Attacking")
	player.move_speed *= 2

func _physics_process(_delta):
	if not player.is_on_floor():
		SM.set_state("Falling")
	
	




func DoDamage():
	pass


func _on_AnimatedSprite_animation_finished():
	SM.set_state("Moving")
