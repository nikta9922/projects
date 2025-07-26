extends CharacterBody2D


var speed=100
var hp=100
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func _ready():
	velocity.x=speed
func _physics_process(delta):
	if $right_wall.is_colliding() or not $floor_right.is_colliding():
		velocity.x=-speed
	if $left_wall.is_colliding() or not $floor_left.is_colliding():
		velocity.x=speed
	if not is_on_floor():
		velocity.y+=gravity*delta
	move_and_slide()
	if velocity.x>0:
		$AnimatedSprite2D.play ("run")
		$AnimatedSprite2D.flip_h=true
	elif velocity.x<0:
		$AnimatedSprite2D.play ("run")
		$AnimatedSprite2D.flip_h=false

	for coll in get_slide_collision_count():
		var object=get_slide_collision(coll).get_collider()
		if object is CharacterBody2D and object.name == "Plaer":
			object.dead_Plaer()
