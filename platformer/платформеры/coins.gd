extends Area2D
var time=0
func _process(delta):
	position.y+=(cos(time*5)*30)*delta
	time+=delta
func _pick_up():
	var tween=get_tree().create_tween()
	tween.tween_property(self, "position:y", position.y-20, 0.2)
	$AudioStreamPlayer2D.play()
	await $AudioStreamPlayer2D.finished
	get_tree().queue_delete(self)

func _on_body_entered(body):
	if body.name=="Plaer":
		_pick_up() # Replace with function body.
		Global.coins+=1
		
