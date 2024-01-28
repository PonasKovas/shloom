extends Control

const SPEED = 250
var moving_choices = false

const MOK_KALBA = preload("res://assets/videos/mokytoja/kalba.ogv")
const MOK_NEUTRAL = preload("res://assets/videos/mokytoja/neutral.ogv")
const MOK_TVARKOSI = preload("res://assets/videos/mokytoja/tvarkosi.ogv")

const JON_KALBA = preload("res://assets/videos/jonukas_kalba.ogv")
const JON_NEUTRAL = preload("res://assets/videos/jonukas_neutral.ogv")

const PET_KALBA = preload("res://assets/videos/petras_kalba.ogv")
const PET_NEUTRAL = preload("res://assets/videos/petras_neutral.ogv")

var pagarbos_taskai = 0

var state = 0

var mokiniai

func _ready():
	mokiniai = [
		$"Zoom/GridContainer/1",
		$"Zoom/GridContainer/2",
		$"Zoom/GridContainer/3",
		$"Zoom/GridContainer/4",
		$"Zoom/GridContainer/5",
		$"Zoom/GridContainer/6",
		$"Zoom/GridContainer/7",
		$"Zoom/GridContainer/8",
		$"Zoom/GridContainer/9",
	]
	pass

func _process(delta):
	if not moving_choices and $choices.position.y < 640:
		$choices.position.y += delta * SPEED
	elif moving_choices and $choices.position.y > 420:
		$choices.position.y -= delta * SPEED
	
	if $choices.position.y > 640:
		$choices.position.y = 640
	elif $choices.position.y < 420:
		$choices.position.y = 420

func set_activated(which):
	if which == "petras":
		$Zoom/GridContainer/petriukas.stream = PET_KALBA
		$Zoom/GridContainer/petriukas.play()
		$Zoom/GridContainer/jonukas.stream = JON_NEUTRAL
		$Zoom/GridContainer/jonukas.play()
		$Zoom/mokytoja.stream = MOK_NEUTRAL
		$Zoom/mokytoja.play()
		$Zoom/GridContainer/petriukas/ACTIVATED.visible = true
		$Zoom/mokytoja/ACTIVATED.visible = false
		$Zoom/GridContainer/jonukas/ACTIVATED.visible = false
		$"Zoom/GridContainer/5/ACTIVATED".visible = false
	elif which == "jonas":
		$Zoom/GridContainer/petriukas.stream = PET_NEUTRAL
		$Zoom/GridContainer/petriukas.play()
		$Zoom/GridContainer/jonukas.stream = JON_KALBA
		$Zoom/GridContainer/jonukas.play()
		$Zoom/mokytoja.stream = MOK_NEUTRAL
		$Zoom/mokytoja.play()
		$Zoom/GridContainer/jonukas/ACTIVATED.visible = true
		$Zoom/GridContainer/petriukas/ACTIVATED.visible = false
		$Zoom/mokytoja/ACTIVATED.visible = false
		$"Zoom/GridContainer/5/ACTIVATED".visible = false
	elif which == "mokytoja":
		$Zoom/GridContainer/petriukas.stream = PET_NEUTRAL
		$Zoom/GridContainer/petriukas.play()
		$Zoom/GridContainer/jonukas.stream = JON_NEUTRAL
		$Zoom/GridContainer/jonukas.play()
		$Zoom/mokytoja.stream = MOK_KALBA
		$Zoom/mokytoja.play()
		$Zoom/mokytoja/ACTIVATED.visible = true
		$Zoom/GridContainer/jonukas/ACTIVATED.visible = false
		$Zoom/GridContainer/petriukas/ACTIVATED.visible = false
		$"Zoom/GridContainer/5/ACTIVATED".visible = false
	elif which == "kitas":
		$Zoom/GridContainer/petriukas.stream = PET_NEUTRAL
		$Zoom/GridContainer/petriukas.play()
		$Zoom/GridContainer/jonukas.stream = JON_NEUTRAL
		$Zoom/GridContainer/jonukas.play()
		$Zoom/mokytoja.stream = MOK_NEUTRAL
		$Zoom/mokytoja.play()
		$"Zoom/GridContainer/5/ACTIVATED".visible = true
		$Zoom/mokytoja/ACTIVATED.visible = false
		$Zoom/GridContainer/jonukas/ACTIVATED.visible = false
		$Zoom/GridContainer/petriukas/ACTIVATED.visible = false

func add_pagarba(kiek):
	pagarbos_taskai += kiek
	$pagarbostaskai.position.y = 0
	if kiek == -1:
		$pagarbostaskai.text = "-1 PAGARBOS TAŠKŲ"
		$pagarbostaskai.label_settings.font_color = Color(1, 0, 0)
		var i = 0
		for mokinys in mokiniai:
			mokinys.stream = [
				preload("res://assets/videos/mokiniai/0/ziovauti.ogv"),
				preload("res://assets/videos/mokiniai/1/ziovauti.ogv"),
				preload("res://assets/videos/mokiniai/2/ziovauti.ogv"),
				preload("res://assets/videos/mokiniai/3/ziovauti.ogv"),
				preload("res://assets/videos/mokiniai/4/ziovauti.ogv"),
				preload("res://assets/videos/mokiniai/5/ziovauti.ogv"),
				preload("res://assets/videos/mokiniai/6/ziovauti.ogv"),
				preload("res://assets/videos/mokiniai/7/ziovauti.ogv"),
				preload("res://assets/videos/mokiniai/8/ziovauti.ogv")
			][i]
			mokinys.play()
			i += 1
	elif kiek == 0:
		$pagarbostaskai.position.y = 1000
	elif kiek == 1:
		$pagarbostaskai.text = "+1 PAGARBOS TAŠKŲ"
		$pagarbostaskai.label_settings.font_color = Color(0, 1, 0)
		var i = 0
		for mokinys in mokiniai:
			mokinys.stream = [
				preload("res://assets/videos/mokiniai/0/laugh1.ogv"),
				preload("res://assets/videos/mokiniai/1/laugh1.ogv"),
				preload("res://assets/videos/mokiniai/2/laugh1.ogv"),
				preload("res://assets/videos/mokiniai/3/laugh1.ogv"),
				preload("res://assets/videos/mokiniai/4/laugh1.ogv"),
				preload("res://assets/videos/mokiniai/5/laugh1.ogv"),
				preload("res://assets/videos/mokiniai/6/laugh1.ogv"),
				preload("res://assets/videos/mokiniai/7/laugh1.ogv"),
				preload("res://assets/videos/mokiniai/8/laugh1.ogv")
			][i]
			mokinys.play()
			i += 1
	elif kiek == 2:
		$pagarbostaskai.text = "+2 PAGARBOS TAŠKŲ"
		$pagarbostaskai.label_settings.font_color = Color(0, 1, 1)
		var i = 0
		for mokinys in mokiniai:
			mokinys.stream = [
				preload("res://assets/videos/mokiniai/0/laugh2.ogv"),
				preload("res://assets/videos/mokiniai/1/laugh2.ogv"),
				preload("res://assets/videos/mokiniai/2/laugh2.ogv"),
				preload("res://assets/videos/mokiniai/3/laugh2.ogv"),
				preload("res://assets/videos/mokiniai/4/laugh2.ogv"),
				preload("res://assets/videos/mokiniai/5/laugh2.ogv"),
				preload("res://assets/videos/mokiniai/6/laugh2.ogv"),
				preload("res://assets/videos/mokiniai/7/laugh2.ogv"),
				preload("res://assets/videos/mokiniai/8/laugh2.ogv")
			][i]
			mokinys.play()
			i += 1

func juokinga():
	var i = 0
	for mokinys in mokiniai:
		if i == 4:
			i += 1
			continue
		mokinys.stream = [
			preload("res://assets/videos/mokiniai/0/laugh2.ogv"),
			preload("res://assets/videos/mokiniai/1/laugh2.ogv"),
			preload("res://assets/videos/mokiniai/2/laugh2.ogv"),
			preload("res://assets/videos/mokiniai/3/laugh2.ogv"),
			preload("res://assets/videos/mokiniai/4/laugh2.ogv"),
			preload("res://assets/videos/mokiniai/5/laugh2.ogv"),
			preload("res://assets/videos/mokiniai/6/laugh2.ogv"),
			preload("res://assets/videos/mokiniai/7/laugh2.ogv"),
			preload("res://assets/videos/mokiniai/8/laugh2.ogv")
		][i]
		mokinys.play()
		i += 1

func pasirinkimas(pasirinkimai):
	moving_choices = true
	disable_buttons(false)
	$"choices/HBoxContainer/1".text = pasirinkimai[0]
	$"choices/HBoxContainer/2".text = pasirinkimai[1]
	if len(pasirinkimai) == 2:
		$"choices/HBoxContainer/3".visible = false
		$"choices/HBoxContainer/4".visible = false
	elif len(pasirinkimai) == 3:
		$"choices/HBoxContainer/3".text = pasirinkimai[2]
		$"choices/HBoxContainer/3".visible = true
		$"choices/HBoxContainer/4".visible = false
	else:
		$"choices/HBoxContainer/3".text = pasirinkimai[2]
		$"choices/HBoxContainer/4".text = pasirinkimai[3]
		$"choices/HBoxContainer/3".visible = true
		$"choices/HBoxContainer/4".visible = true

func first_choice():
	moving_choices = false
	disable_buttons(true)
	if state == 0: # negirdim
		add_pagarba(+1)
		$audio.stream = preload("res://assets/audio/petras/negirdim.wav")
		$audio.play()
		set_activated("petras")
		state = 1
	elif state == 5: # taip dabar gerai
		add_pagarba(-1)
		$audio.stream = preload("res://assets/audio/petras/dabar_gerai.wav")
		$audio.play()
		set_activated("petras")
		state = 6
	elif state == 7: # priminti apie namu darbus
		add_pagarba(-1)
		$audio.stream = preload("res://assets/audio/petras/o_namu_darbai.wav")
		$audio.play()
		set_activated("petras")
		state = 8
	elif state == 9: # o ar pati atlikote?
		add_pagarba(+2)
		$audio.stream = preload("res://assets/audio/petras/ar_pati_atlikote.wav")
		$audio.play()
		set_activated("petras")
		state = 10
	elif state == 12: # 3 su puse plius minus ok
		add_pagarba(+2)
		$audio.stream = preload("res://assets/audio/nd_atsakymas.mp3")
		$audio.play()
		set_activated("petras")
		state = 13
	elif state == 18: # ALIO VI MINIA SLISHITE
		add_pagarba(+2)
		$audio.stream = preload("res://assets/audio/petras/alio_vi_menia_slishite.wav")
		$audio.play()
		set_activated("petras")
		state = 19
	elif state == 20: # čia jonas
		add_pagarba(+2)
		$audio.stream = preload("res://assets/audio/petras/cia_jonas.wav")
		$audio.play()
		set_activated("petras")
		state = 21
	elif state == 23: # spauskite screen share
		add_pagarba(-1)
		$audio.stream = preload("res://assets/audio/petras/spauskte_screenshare.wav")
		$audio.play()
		set_activated("petras")
		state = 24
	elif state == 28: # spauskite alt f4
		add_pagarba(+2)
		$audio.stream = preload("res://assets/audio/petras/spauskite_altf4.wav")
		$audio.play()
		set_activated("petras")
		state = 25

func second_choice():
	moving_choices = false
	disable_buttons(true)
	if state == 0: # tyleti
		state = 36
		_on_audio_finished()
	elif state == 5: # tylėti
		state = 34
		$timer.start(3)
	elif state == 7: # tylėti
		$audio.stream = preload("res://assets/audio/mokytoja/jon_o_kaip_del_nd.wav")
		$audio.play()
		set_activated("jonas")
		state = 8
	elif state == 9: # buvo namu darbu?
		add_pagarba(+1)
		$audio.stream = preload("res://assets/audio/petras/ar_buvo_namu_darbai.wav")
		$audio.play()
		set_activated("petras")
		state = 33
	elif state == 12: # O kiek reikia?
		add_pagarba(+1)
		$audio.stream = preload("res://assets/audio/petras/o_kiek_reikia.wav")
		$audio.play()
		set_activated("petras")
		state = 31
	elif state == 18: # mokytoja mes viska girdim
		add_pagarba(-1)
		$audio.stream = preload("res://assets/audio/petras/mes_viska_girdim.wav")
		$audio.play()
		set_activated("petras")
		state = 27
	elif state == 20: # tyleti
		$audio.stream = preload("res://assets/audio/jon_cia_buvo_petras.wav")
		$audio.play()
		set_activated("jonas")
		$timer.start(2.5)
		state = 26
	elif state == 23: # spauskite alt f4
		add_pagarba(+2)
		$audio.stream = preload("res://assets/audio/petras/spauskite_altf4.wav")
		$audio.play()
		set_activated("petras")
		state = 24
	elif state == 28: # spauskite mirkofona
		add_pagarba(-1)
		$audio.stream = preload("res://assets/audio/petras/paspauskite_mikrotona.wav")
		$audio.play()
		set_activated("petras")
		state = 29

func third_choice():
	moving_choices = false
	disable_buttons(true)
	if state == 0: # padaryti keist garsa
		add_pagarba(+2)
		$audio.stream = [
			preload("res://assets/audio/petras/bezdalas.wav"),
			preload("res://assets/audio/petras/kriukriu.wav")
		][randi() % 2]
		$audio.play()
		set_activated("petras")
		state = 37
	elif state == 5: # padaryti keista garsa
		add_pagarba(+2)
		$audio.stream = [
			preload("res://assets/audio/petras/bezdalas.wav"),
			preload("res://assets/audio/petras/kriukriu.wav")
		][randi() % 2]
		$audio.play()
		set_activated("petras")
		state = 35
	elif state == 9: # taip atlikau namu darbus
		add_pagarba(-1)
		$audio.stream = preload("res://assets/audio/petras/taip_atlikau.wav")
		$audio.play()
		set_activated("petras")
		state = 11
	elif state == 12: # 13 saknis is 2
		add_pagarba(-1)
		$audio.stream = preload("res://assets/audio/petras/trylika_saknis_is_dvieju.wav")
		$audio.play()
		set_activated("petras")
		state = 32
	elif state == 20: # čia as petras
		add_pagarba(-1)
		$audio.stream = preload("res://assets/audio/petras/cia_as_Petras.wav")
		$audio.play()
		set_activated("petras")
		$timer.start(2.5)
		state = 26


func fourth_choice():
	moving_choices = false
	disable_buttons(true)
	if state == 0: # girdim
		add_pagarba(-1)
		$audio.stream = preload("res://assets/audio/petras/girdim.wav")
		$audio.play()
		set_activated("petras")
		state = 36

func disable_buttons(disabled):
	$"choices/HBoxContainer/1".disabled = disabled
	$"choices/HBoxContainer/2".disabled = disabled
	$"choices/HBoxContainer/3".disabled = disabled
	$"choices/HBoxContainer/4".disabled = disabled

func time_out():
	if state == 0:
		$audio.stream = preload("res://assets/audio/tikrina_ar_yra_garsas.wav")
		$audio.play()
		set_activated("mokytoja")
	elif state == 7:
		pasirinkimas(["Priminti apie namų darbus", "Tylėti"])
	elif state == 21:
		$Zoom/GridContainer/jonukas.visible = false
		set_activated("mokytoja")
		state = 22
	elif state == 25:
		get_node("/root/Singleton").pagarbos_taskai = pagarbos_taskai
		get_tree().change_scene_to_file("res://end.tscn")
	elif state == 26:
		get_node("/root/Singleton").pagarbos_taskai = pagarbos_taskai
		get_tree().change_scene_to_file("res://kicked.tscn")
	elif state == 34:
		state = 6
		_on_audio_finished()


func _on_audio_finished():
	if state == 0:
		pasirinkimas(["\"Negirdim\"", "Tylėti", "Padaryti keistą garsą", "Taip girdim"])
	elif state == 1:
		$audio.stream = preload("res://assets/audio/static_mic.wav")
		$audio.play()
		set_activated("mokytoja")
		state = 4
	elif state == 4:
		$noise.stop()
		$audio.stream = preload("res://assets/audio/mokytoja/mhmm_o_dabar_gerai.wav")
		$audio.play()
		set_activated("mokytoja")
		state = 5
	elif state == 5:
		pasirinkimas(["\"Taip, dabar gerai\"", "Tylėti", "Padaryti keistą garsą"])
	elif state == 6:
		$audio.stream = preload("res://assets/audio/mokytoja/viskas_pradedame_pamoka.wav")
		$audio.play()
		set_activated("mokytoja")
		$timer.start(5)
		state = 7
	elif state == 7:
		moving_choices = false
		disable_buttons(true)
		$audio.stream = preload("res://assets/audio/mokytoja/jon_o_kaip_del_nd.wav")
		$audio.play()
		set_activated("jonas")
		state = 8
	elif state == 8:
		$audio.stream = preload("res://assets/audio/mokytoja/ai_tiksliai_ar_visi_atlikote_nd.wav")
		$audio.play()
		set_activated("mokytoja")
		state = 9
	elif state == 9:
		pasirinkimas(["\"O ar pati atlikote?\"", "Buvo namų darbų?", "Taip atlikau"])
	elif state == 10:
		$audio.stream = preload("res://assets/audio/mokytoja/koks_izulumas_dar_nesamone_skrisi.wav")
		$audio.play()
		set_activated("mokytoja")
		state = 11
	elif state == 11:
		$audio.stream = preload("res://assets/audio/mokytoja/na_pasitikrinkime_nd_kiek_gavote.wav")
		$audio.play()
		set_activated("mokytoja")
		state = 12
	elif state == 12:
		pasirinkimas(["\"3 su puse minus, plius minus OK\"", "\"O kiek reikia?\"", "\"13 šaknų iš 2\""])
	elif state == 13:
		$audio.stream = preload("res://assets/audio/mokytoja/tylos_netrukdyk_man_dirbti.wav")
		$audio.play()
		set_activated("mokytoja")
		state = 14
	elif state == 14:
		$audio.stream = preload("res://assets/audio/kitasPadauza_15_mldr_tukst.wav")
		$audio.play()
		set_activated("kitas")
		juokinga()
		state = 15
	elif state == 15:
		$audio.stream = preload("res://assets/audio/mokytoja/viskas_uzteks_cirko_teisingas_ats.wav")
		$audio.play()
		set_activated("mokytoja")
		state = 16
	elif state == 16:
		$audio.stream = preload("res://assets/audio/mokytoja/gerai_dabar_jau_tikrai_pradedadam_pamoka.wav")
		$audio.play()
		set_activated("mokytoja")
		state = 17
	elif state == 17:
		$audio.stream = preload("res://assets/audio/mokytoja/oj_atsiprasau_skambina_pokalbis_rus_rycka.wav")
		$audio.play()
		set_activated("mokytoja")
		state = 18
	elif state == 18:
		pasirinkimas(["\"АЛО ТЫ МЕНЯ СЛЫШИШЬ?\"", "\"Mokytoja mes viską girdime\""])
	elif state == 19:
		$audio.stream = preload("res://assets/audio/mokytoja/rycka_ja_tebia_pirizvaniu.wav")
		$audio.play()
		set_activated("mokytoja")
		state = 20
	elif state == 20:
		pasirinkimas(["\"Čia Jonas\"", "Tylėti", "\"Čia aš - Petras\""])
	elif state == 21:
		$audio.stream = preload("res://assets/audio/mokytoja/jon_pradeda_gincytis.wav")
		$audio.play()
		set_activated("jonas")
		$timer.start(3.5)
	elif state == 22:
		$audio.stream = preload("res://assets/audio/mokytoja/hmm.wav")
		$audio.play()
		set_activated("mokytoja")
		pasirinkimas(["\"Mokytoja spauskite screen-share mygtuką\"", "Mokytoja, spauskite alt + F4"])
		state = 23
	elif state == 24:
		$audio.stream = preload("res://assets/audio/mokytoja/zinau_ko_man_cia_aiskini.wav")
		$audio.play()
		set_activated("mokytoja")
		state = 25
	elif state == 25:
		$timer.start(1.5)
	elif state == 27:
		$audio.stream = preload("res://assets/audio/mokytoja/oj_tai_kaip_man_uzsimutinti.wav")
		$audio.play()
		set_activated("mokytoja")
		state = 28
	elif state == 28:
		pasirinkimas(["\"Spauskite alt+F4\"", "Paspauskite mikrofono mygtuką"])
	elif state == 29:
		$audio.stream = preload("res://assets/audio/mokytoja/hmm_be_loop.wav")
		$audio.play()
		set_activated("mokytoja")
		state = 30
	elif state == 30:
		$audio.stream = preload("res://assets/audio/kitasPadauza_altfketuri.wav")
		$audio.play()
		set_activated("kitas")
		juokinga()
		state = 25
		$timer.start(3.5)
	elif state == 31:
		$audio.stream = preload("res://assets/audio/mokytoja/petrai_gana_repliku_pastaba.wav")
		$audio.play()
		set_activated("mokytoja")
		state = 14
	elif state == 32:
		$audio.stream = preload("res://assets/audio/mokytoja/neteisingai_kas_turi_kitu_variantu.wav")
		$audio.play()
		set_activated("mokytoja")
		state = 14
	elif state == 33:
		$audio.stream = preload("res://assets/audio/mokytoja/aha_matau_petriukas_neatliko_nd.wav")
		$audio.play()
		set_activated("mokytoja")
		state = 11
	elif state == 35:
		$audio.stream = preload("res://assets/audio/mokytoja/kas_cia_vyksta_tylos.wav")
		$audio.play()
		set_activated("mokytoja")
		state = 6
	elif state == 36:
		$audio.stream = preload("res://assets/audio/jon_mokytoja_jusu_mic_labai_uzia.wav")
		$audio.play()
		set_activated("jonas")
		state = 1
	elif state == 37:
		$audio.stream = preload("res://assets/audio/mokytoja/kas_cia_vyksta_tylos.wav")
		$audio.play()
		set_activated("mokytoja")
		state = 36
