extends VideoStreamPlayer

var original

# Called when the node enters the scene tree for the first time.
func _ready():
	original = self.stream


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_finished():
	self.stream = original
	self.play()
