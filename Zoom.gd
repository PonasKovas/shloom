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
	self.visible = false
	$"../Zoom#AudioStreamPlayer".playing = false
	$"../Timer".start(2)


func _on_join():
	get_tree().change_scene_to_file("res://meeting.tscn")
