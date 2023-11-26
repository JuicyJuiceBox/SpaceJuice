extends Node2D


@onready var player_spawn_pos = $PlayerSpawn
@onready var PPC = $PewPewContainer
@onready var EC = $EnemyContainer
@onready var timer = $Timer
@onready var GS = preload("res://Enemies/GrayShip.tscn")

var player = null

func _ready():
	player = get_tree().get_first_node_in_group("Player")
	assert(player!=null)
	player.global_position = player_spawn_pos.global_position
	player.pew.connect(_on_player_pewpew)
	_on_timer_timeout()

func _process(_delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()

func _on_player_pewpew(pewpew, location):
	var pew = pewpew.instantiate()
	pew.global_position = location
	PPC.add_child(pew)

func enemy_spawn(location):
	var enemy = GS.instantiate()
	enemy.global_position = location
	EC.add_child(enemy)

func _on_timer_timeout():
	enemy_spawn(Vector2(randf_range(50, 500), -50))
	timer.start()
#DADDY CHILL!
