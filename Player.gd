extends AnimatedSprite


var directionindicator=1
export var speed=5
var bullet=preload("res://Bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_pressed("MoveRight")&&position.x<2300:
		play("idle")
		translate(Vector2(speed,0))
		set_scale(Vector2(1.5,1.5))
		directionindicator=1 #TODO remove
	if Input.is_action_pressed("MoveLeft")&&position.x>-300:
		play("idle")
		translate(Vector2(-speed,0))
		set_scale(Vector2(-1.5,1.5))
		directionindicator=-1 #TODO remove
	if Input.is_action_pressed("MoveUp")&&position.y>-100:
		play("idle")
		translate(Vector2(0,-speed))
	if Input.is_action_pressed("MoveDown")&&position.y<360:
		play("idle")
		translate(Vector2(0,speed))	
	if Input.is_action_pressed("Shoot"):
		play("Shoot") #TODO limit time
		var b=bullet.instance()
		b.position=get_node("BulletPosition").get_global_position()
		b.setDirection(directionindicator)
		get_tree().get_root().add_child(b) #This is basically to always have a next bullet
		print(b.position)
		
func getDirectionIndicator():
	return directionindicator		
		



