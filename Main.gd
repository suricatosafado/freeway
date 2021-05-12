extends Node

const Cars = preload("res://Cars.tscn")

var sTrack = [600, 544, 438, 324, 384, 216, 160]
var fTrack = [488, 272, 104]

var score1 = 0
var score2 = 0

func _ready():
	$Button.hide()
	$Theme.play()
	randomize()

func _on_TimerFastCars_timeout():
	var cars = Cars.instance()
	add_child(cars)
	cars.position.x = -10
	cars.position.y = fTrack[randi() % fTrack.size()]
	cars.linear_velocity = Vector2(rand_range(700,710), 0)


func _on_TimerSlowCars_timeout():
	var cars = Cars.instance()
	add_child(cars)
	cars.position.x = -10
	cars.position.y = sTrack[randi() % sTrack.size()]
	cars.linear_velocity = Vector2(rand_range(300,310), 0)


func _on_Player_point():
	if score1 < 10:
		score1 += 1
		$Point.play()
		$ScoreLabel1.text = str(score1)
	if score1 >= 10:
		$Button.show()
		$Theme.stop()
		$ResultLabel.text = "O vencedor é P1!"
		$Winner.play()
		$TimerFastCars.stop()
		$TimerSlowCars.stop()
		players_exited()


func _on_Player2_point2():
	if score2 < 10:
		score2 += 1
		$Point.play()
		$ScoreLabel2.text = str(score2)
	if score2 >= 10:
		$Button.show()
		$Theme.stop()
		$ResultLabel.text = "O vencedor é P2!"
		$Winner.play()
		$TimerFastCars.stop()
		$TimerSlowCars.stop()
		players_exited()

func players_exited():
	$Player.queue_free()
	$Player2.queue_free()

func _on_Button_pressed():
	$Button.hide()
# warning-ignore:return_value_discarded
	get_tree().reload_current_scene()
