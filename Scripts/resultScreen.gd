extends Node2D

var resultText:String
@export var RichLabel:RichTextLabel

func _ready():
	get_window().position = global.windowPOS
	IDK()
	RichLabel.bbcode_text = resultText
	
func IDK():
	if str(global.result) == "nan"  || global.result == null || global.result == INF:
		resultText = ("[center]IDK[/center]")
	else:
		resultText = ("[center]"+str(global.result)+"[/center]")


func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_window.tscn")
