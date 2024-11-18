extends Node2D



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.on_death()
		get_tree().change_scene_to_file("res://Menus/game_over_menu.tscn")
