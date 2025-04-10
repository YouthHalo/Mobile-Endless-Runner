extends CanvasLayer


@onready var mobile = $"Mobile UI"
@onready var jumpMobile = $"Mobile UI/Jump" 
# Called when the scene is ready
func _ready():
	pass

# Input detection
func _input(event):
	if event is InputEventScreenTouch:
		# Show the CanvasLayer when using touch
		mobile.visible = true
	elif event is InputEventKey:
		# Hide the CanvasLayer for mouse/keyboard
		mobile.visible = false


func _on_jump_pressed() -> void:
		Input.action_press("jump")  # Simulate pressing the "jump" action

func _on_jump_button_up() -> void:
		Input.action_release("jump")  # Simulate pressing the "jump" action
