extends Label

var elapsed = 0

func _ready():
	self.text = "SURINKTA " + str(get_node("/root/Singleton").pagarbos_taskai) + " PAGARBOS TAŠKŲ"

func _process(delta):
	elapsed += delta
	var alpha = elapsed / 3
	print(alpha)
	if alpha > 1:
		alpha = 1
	self.modulate = Color(1,1,1, alpha)
