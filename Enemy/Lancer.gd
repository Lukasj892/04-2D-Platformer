extends KinematicBody2D

var is_moving_left = true

var gravity = 32
var velocity = Vector2.ZERO

var speed = 256

# warning-ignore:unused_argument
func _physics_process(delta):
	MoveCharacter()
	DetectTurnAround()

func MoveCharacter():
	if is_moving_left:
		velocity.x = -speed
	else:
		velocity.x = speed
	
	velocity.y += gravity
	
	velocity = move_and_slide(velocity, Vector2.UP)

func DetectTurnAround():
	if not $RayCast2D.is_colliding() and is_on_floor():
		if is_moving_left:
			is_moving_left = false
		else:
			is_moving_left = true
		scale.x = -scale.x
		#print("Enemy turn around pls.")


func _on_DetectPlayer_body_entered(body): #Connected to DetectPlayer (Area2D object)
	if body.name == "Player":
		get_tree().reload_current_scene()
