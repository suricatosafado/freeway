extends Area2D

export(int) var SPEED : int = 100

var screen_size

signal point


func _ready():
	screen_size = get_viewport_rect().size

func _process(delta : float) -> void:
	var velocity = Vector2()
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	position += velocity * delta
	position.y = clamp(position.y, 0, screen_size.y)
	
	if velocity.y > 0:
		$AnimatedSprite.animation = "down"
	elif velocity.y < 0:
		$AnimatedSprite.animation = "up"

func _on_Player_body_entered(body):
	if body.name == "Win":
		emit_signal("point")
	else:
		$AudioStreamPlayer2D.play()
	back_position()

func back_position():
	position.x = 320
	position.y = 696
