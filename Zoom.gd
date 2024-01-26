extends TextureRect


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	self.visible = true
	$"../Zoom#AudioStreamPlayer".playing = true


func _on_close():
	get_tree().quit()


func _on_join():
	pass # Replace with function body.
