extends CanvasLayer


# Called when the node enters the scene tree for the first time.



func _on_back_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Menus/main_menu.tscn")
