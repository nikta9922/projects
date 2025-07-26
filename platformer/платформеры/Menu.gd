extends CanvasLayer
var time=0

func _process(delta):
	time+=delta
	
	$VBoxContainer/Time.text=str("time ",time)
	$VBoxContainer/Coin.text=str("coins ",Global.coins)
