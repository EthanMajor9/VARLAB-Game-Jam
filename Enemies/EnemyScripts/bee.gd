extends CharacterBody2D

@onready var sprite : AnimatedSprite2D = $AnimatedSprite2D

var player_vars : PlayerVariables
var speed : float = 45
var player_chase : bool = false
var player : Player = null

func _ready():
	player_vars = get_node("/root/PlayerVariables")

func _physics_process(_delta):
	if player_chase:
		position += (player.position - position) / speed
		change_direction_of_sprite()

func change_direction_of_sprite():
	if player.position.x > position.x:
		sprite.flip_h = true
	else:
		sprite.flip_h = false		 
		
func _on_detection_area_body_entered(body):
	if body is Player:
		player = body
		player_chase = true

func _on_detection_area_body_exited(body):
	if body is Player:
		player = null
		player_chase = false

func _on_hit_detection_body_entered(body):
	if body is Player:
		player_vars.health -= 50
		
