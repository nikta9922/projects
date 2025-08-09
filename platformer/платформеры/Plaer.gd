extends CharacterBody2D
var speed=200
var hp=3
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var jump_velocity=-300
var timer_hp=0

@onready var anim_plaer = $AnimatedSprite2D
func _physics_process(delta):
	timer_hp+=delta
	
	if not is_on_floor():
		velocity.y+=gravity*delta
		if velocity.y>=0:
			anim_plaer.play("fall")
		else:
			anim_plaer.play("jump")
	else:
		if velocity.x==0:
			$AnimatedSprite2D.play("idle")
		else:
			anim_plaer.play("run")
	if Input.is_action_pressed("ui_accept") and is_on_floor():
		velocity.y=jump_velocity
	var direction= Input.get_axis("Left","Right")
	if direction:
		velocity.x=direction*speed
	else:
		velocity.x=move_toward(velocity.x,0,speed)
	
	move_and_slide()
	if velocity.x>0:
		$AnimatedSprite2D.flip_h=false
	elif velocity.x<0:
		$AnimatedSprite2D.flip_h=true
func dead_Plaer():
	if timer_hp>1:
		
		hp-=1
		timer_hp=0
		print(hp)
		
		if hp<=0:
			var tween_jump=get_tree().create_tween()
			tween_jump.tween_property(self, "position:y", position.y-50, 0.2)
			$CollisionShape2D.disabled=true
			print("you_die")
	


func _on_kill_zone_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		velocity.y=jump_velocity/1.5
		body.bot_hit()
