extends AnimatedSprite


onready	var DeParent=get_parent()
export var speed=0.15
var directionIndicator=1
var dead=false
onready var player=get_parent().get_parent().get_parent().get_node("Player")
var bullet=preload("res://SoldierBullet.tscn")
var Canfire=true
var hasSeenPlayer=false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !dead:
		if not hasSeenPlayer:
			DeParent.unit_offset+=(directionIndicator*speed*delta)
			if DeParent.unit_offset<=0.1:
				directionIndicator=1
				play("Run")
				flip_h=true
			elif DeParent.unit_offset>=0.9:
				directionIndicator=-1
				play("Run")
				flip_h=false
		else:
			play("Shoot")
			
		print(position.x-player.position.x)
		
		if position.x-player.position.x<100&& Canfire:
			if player.getDirectionIndicator()!=directionIndicator:
				var b= bullet.instance()
				hasSeenPlayer=true
				b.position=get_node("EnemyBulletPosition").get_global_position()
				b.setDirection(directionIndicator)
				get_tree().get_root().add_child(b)
				Canfire=false
				yield(get_tree().create_timer(0.3),"timeout")
				Canfire=true
			else:
				hasSeenPlayer=false


func _on_Area2D_area_entered(area):
	if area.is_in_group("Bullet"):
		play("idle") #I'm poor I have no death animation
		rotate(180) 
		dead=true
		yield(get_tree().create_timer(1),"timeout")
		playing=false
