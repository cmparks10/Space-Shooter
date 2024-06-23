extends CharacterBody2D

var screenSize : Vector2i
#Setting the first clamp Vector 2y position so the ship does not move off screen
var myClampVector2FirstParam = Vector2(0.0, 40.0)
@export var joystick_left : VirtualJoystick
var move_vector := Vector2.ZERO
const SPEED = 800.0
const JUMP_VELOCITY = -400.0

func _ready():
	screenSize = get_window().size
	#Offsetting -y of screen so the whole ship stays on the screen when it hits the bottom
	#if you get rid of this only half the ship stays on screen
	screenSize.y -= 40

func _process(delta):
	if not get_parent().gameRunning:
		pass
	else:
	# Get the input direction and handle the movement/decel eration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#this determines the 
	
		var input_vector = Vector2.ZERO
		var direction = Vector2.ZERO
		#input_vector.x = Input.get_axis("ui_left", "ui_right")
		input_vector.y = Input.get_axis("ui_up", "ui_down")
		
		direction = Input.get_axis("ui_up", "ui_down")

		if direction:
			velocity.y = direction * SPEED
		else:
			velocity.y = move_toward(velocity.x, 0, SPEED)

		print("screen size",screenSize)

		#get the position of the ship
		position += move_vector*velocity * delta
		#Constantly adding 50 to the screen size to prevent the player from falling offscreen
		screenSize.x += 50.0
		
		#Clamp Vector2 (min, max)
		
		position = position.clamp(myClampVector2FirstParam, screenSize)
		print("position", position)

		move_and_slide()



