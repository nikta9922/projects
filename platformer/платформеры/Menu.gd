extends CanvasLayer
var time=0

func _process(delta):
	time+=delta
	
	$TextureProgressBar.value=$"../Plaer".hp
	$VBoxContainer/Time.text=str("time ",time)
	$VBoxContainer/Coin.text=str("coins ",Global.coins)
