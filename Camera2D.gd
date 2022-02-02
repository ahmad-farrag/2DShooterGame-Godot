extends Camera2D

#an offset to avoid having the player at the edge of the screen (edge of camera)
var offsett=Vector2(300,0)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position=get_parent().get_node("Player").position+offsett
