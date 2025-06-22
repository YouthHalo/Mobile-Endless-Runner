extends Node2D

@onready var window: Window = get_window()
@onready var base_size: Vector2i = window.content_scale_size

func _ready() -> void:
	DisplayServer.window_set_min_size(Vector2(320, 180)) #the window looks weird below this value
	window.size_changed.connect(window_size_changed) 
	window_size_changed() #needed otherwise incorrectly scaled at startup
	
func window_size_changed():
	if window.size.x > 320 or window.size.y > 180 or DisplayServer.WINDOW_MODE_MAXIMIZED: #it crashes otherwise
		var scale: Vector2i = window.size / base_size
		var min_scale = min(scale.x, scale.y)
		if min_scale > 0:
			window.content_scale_size = window.size / min_scale # Prevent divide by zero
	
## The whole point of this code is to integer scale properly without black borders
## The default Godot 4.3 Implementation does not have this
