extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	var os = OS.get_name()
	if os == "Android":
		$".".text = "TOUCH TO PLAY"
	else:
		$".".text = "PRESS SPACE TO PLAY"
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
