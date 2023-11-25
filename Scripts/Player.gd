extends CharacterBody2D

signal pew(pewpew,location)

@export var speed = 300

var pewpew = preload("res://Player/PewPew.tscn")

@onready var muzzle = $Muzzle

func _ready():
	pass

func _process(_delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()

func _physics_process(_delta):
	var direction = Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down"))
	velocity = direction * speed
	move_and_slide()

func shoot():
	pew.emit(pewpew, muzzle.global_position)
