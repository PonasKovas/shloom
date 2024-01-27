extends Control

const SPEED = 250
var moving_choices = false

const MOK_KALBA = preload("res://assets/videos/mokytoja/kalba.ogv")
const MOK_NEUTRAL = preload("res://assets/videos/mokytoja/neutral.ogv")


# 0 - pradzia
# 1 - negirdim
# 2 - keistas garsas
# 3 - girdim
var state = 0

func _ready():
	pass

func set_activated(which):
	if which == "petras":
		#$Zoom/GridContainer/petriukas.stream = preload()
		#$Zoom/GridContainer/petriukas.play()
		$Zoom/GridContainer/petriukas/ACTIVATED.visible = true
		$Zoom/mokytoja/ACTIVATED.visible = false
		$Zoom/GridContainer/jonukas/ACTIVATED.visible = false
	elif which == "jonas":
		$Zoom/GridContainer/jonukas/ACTIVATED.visible = true
		$Zoom/GridContainer/petriukas/ACTIVATED.visible = false
		$Zoom/mokytoja/ACTIVATED.visible = false
	elif which == "mokytoja":
		$Zoom/mokytoja/ACTIVATED.visible = true
		$Zoom/GridContainer/jonukas/ACTIVATED.visible = false
		$Zoom/GridContainer/petriukas/ACTIVATED.visible = false

func _input(ev):
	# speed up development
	if ev is InputEventKey and ev.keycode == KEY_SPACE and not ev.echo and ev.pressed:
		$audio.stop()
		_on_audio_finished()
		

func _process(delta):
	if not moving_choices and $choices.position.y < 640:
		$choices.position.y += delta * SPEED
	elif moving_choices and $choices.position.y > 420:
		$choices.position.y -= delta * SPEED
	
	if $choices.position.y > 640:
		$choices.position.y = 640
	elif $choices.position.y < 420:
		$choices.position.y = 420


func first_choice():
	moving_choices = false
	disable_buttons(true)
	if state == 0: # negirdim
		$audio.stream = preload("res://assets/audio/petras/negirdim.wav")
		$audio.play()
		
		set_activated("petras")
		state = 1


func second_choice():
	moving_choices = false
	disable_buttons(true)
	if state == 0: # tyleti
		pass


func third_choice():
	moving_choices = false
	disable_buttons(true)
	if state == 0: # padaryti keist garsa
		$audio.stream = [
			preload("res://assets/audio/petras/bezdalas.wav"),
			preload("res://assets/audio/petras/kriukriu.wav")
		][randi() % 2]
		$audio.play()
		
		set_activated("petras")
		state = 2


func fourth_choice():
	moving_choices = false
	disable_buttons(true)
	if state == 0: # girdim
		$audio.stream = preload("res://assets/audio/petras/girdim.wav")
		$audio.play()
		
		set_activated("petras")
		state = 3

func disable_buttons(disabled):
	$"choices/HBoxContainer/1".disabled = disabled
	$"choices/HBoxContainer/2".disabled = disabled
	$"choices/HBoxContainer/3".disabled = disabled
	$"choices/HBoxContainer/4".disabled = disabled

func time_out():
	if state == 0:
		$audio.stream = preload("res://assets/audio/tikrina_ar_yra_garsas.wav")
		$audio.play()
		$Zoom/mokytoja.stream = MOK_KALBA
		$Zoom/mokytoja.play()


func _on_audio_finished():
	if state == 0:
		moving_choices = true
		disable_buttons(false)
		$Zoom/mokytoja.stream = MOK_NEUTRAL
		$Zoom/mokytoja.play()
		$"choices/HBoxContainer/1".text = "\"Negirdim\""
		$"choices/HBoxContainer/2".text = "Tylėti"
		$"choices/HBoxContainer/3".text = "Padaryti keistą garsą"
		$"choices/HBoxContainer/4".text = "Taip girdim"
