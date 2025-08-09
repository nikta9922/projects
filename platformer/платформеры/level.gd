extends Node2D

#func _process(delta):
	#if $Plaer.position.y>=641:
		#$Plaer.position=Vector2(-1265, 361)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name=="Plaer":
		$CanvasLayer.visible=true
