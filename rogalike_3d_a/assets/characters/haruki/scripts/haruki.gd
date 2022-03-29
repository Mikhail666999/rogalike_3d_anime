extends KinematicBody

var dir = Vector3()

func _ready():
	pass # Replace with function body.


func _process(delta):
	dir.y = look_at_from_position(Vector3(0, g.pos_player.y))
	pass
