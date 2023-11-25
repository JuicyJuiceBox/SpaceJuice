extends Area2D

@export var speed = 200

func _ready():
	pass

func _physics_process(delta):
	global_position.y += speed * delta

func _on_area_entered(_area):
	queue_free()
