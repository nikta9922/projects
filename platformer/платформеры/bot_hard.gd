extends CharacterBody2D

var PlaerZone=false
var speed=100
var hp=100
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func _ready():
	velocity.x=speed
func _physics_process(delta):
	if PlaerZone==false:
		if $right_wall.is_colliding() or not $floor_right.is_colliding():
			velocity.x=-speed
		if $left_wall.is_colliding() or not $floor_left.is_colliding():
			velocity.x=speed
		if not is_on_floor():
			velocity.y+=gravity*delta
		
		if velocity.x>0:
			$AnimatedSprite2D.play ("walk")
			$AnimatedSprite2D.flip_h=true
		elif velocity.x<0:
			$AnimatedSprite2D.play ("walk")
			$AnimatedSprite2D.flip_h=false
	else:
		if not is_on_floor():
			velocity.y+=gravity*delta
		if position.x>$"../Plaer".position.x:
			velocity.x=-speed
			$AnimatedSprite2D.flip_h=false
		else:
			velocity.x=speed
			$AnimatedSprite2D.flip_h=true
	move_and_slide()
	for coll in get_slide_collision_count():
		var object=get_slide_collision(coll).get_collider()
		if object is CharacterBody2D and object.name == "Plaer":
			object.dead_Plaer()


func _on_zone_body_entered(body: Node2D) -> void:
	if body.name=="Plaer":
		PlaerZone=true
		$AnimatedSprite2D.play ("run") # Replace with function body.


func _on_zone_body_exited(body: Node2D) -> void:
	if body.name=="Plaer":
		PlaerZone=false # Replace with function body.
