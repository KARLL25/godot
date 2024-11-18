extends CanvasLayer

func _process(delta: float) -> void:
	$HBoxContainer/MarginContainer/Score.text = "Очки: " + str(GlobalVars.score)


func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Menus/main_menu.tscn")
