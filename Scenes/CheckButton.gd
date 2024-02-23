extends CheckButton

func _on_toggled(toggled_on):

	if toggled_on == true:
		get_tree().get_root().size = Vector2(960, 960)
	if toggled_on == false:
		get_tree().get_root().size = Vector2(480, 480)
