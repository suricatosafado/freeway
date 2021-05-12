extends RigidBody2D


func _ready():
	var carcolor = $AnimatedSprite.frames.get_animation_names()
	$AnimatedSprite.animation = carcolor[randi() % carcolor.size()]

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
