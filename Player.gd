extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("MoveRight")&&position.x<2300:
		translate(Vector2(5,0))
		set_scale(Vector2(1.5,1.5))
	if Input.is_action_pressed("MoveLeft")&&position.x>-300:
		translate(Vector2(-5,0))
		set_scale(Vector2(-1.5,1.5))
	if Input.is_action_pressed("MoveUp")&&position.y>-100:
		translate(Vector2(0,-5))
	if Input.is_action_pressed("MoveDown")&&position.y<360:
		translate(Vector2(0,5))	
