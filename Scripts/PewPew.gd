extends Area2D

@export var speed = 600

func _ready():
	$AnimationTree.active

func _physics_process(delta):
	global_position.y += -speed * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	

func _on_area_entered(_area):
	queue_free()
