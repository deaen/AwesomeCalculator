extends Node2D
#idk
@onready var transition = $transition
@onready var settingsWindow = $Window


# main vars
var fieldOne
var operatorIndex
var fieldTwo

# field one vars
var fieldOneNum1
var fieldOneNum2
var fieldOneCombined:String

# field one vars
var fieldTwoNum1
var fieldTwoNum2
var fieldTwoCombined:String


#window shake thing
var randomStrength:float = 5
var rng = RandomNumberGenerator.new()
var shake_strength: float = 0.0

func _ready():
	global.result = 0.0
	operatorIndex = $operator.get_selected_id()

func _process(_delta):
	get_window().position += randomWindowOffest()

func applyShake():
	shake_strength = randomStrength
	
func randomWindowOffest() -> Vector2i:
	return Vector2(rng.randf_range(-shake_strength,shake_strength),rng.randf_range(-shake_strength,shake_strength))

func _on_st_num_field_1_item_selected(index):
	fieldOneNum1 = index
func _on_st_num_field_2_item_selected(index):
	fieldOneNum2 = index
func _on_nd_num_field_1_item_selected(index):
	fieldTwoNum1 = index
func _on_nd_num_field_2_item_selected(index):
	fieldTwoNum2 = index
func _on_operator_item_selected(index):
	operatorIndex = index
func combineNums():
	if fieldOneNum1 == null:
		fieldOneNum1 = 0
	if fieldOneNum2 == null:
		fieldOneNum2 = 0
	if fieldTwoNum1 == null:
		fieldTwoNum1 = 0
	if fieldTwoNum2 == null:
		fieldTwoNum2 = 0
	fieldOneCombined = str(fieldOneNum1) + str(fieldOneNum2)
	fieldTwoCombined = str(fieldTwoNum1) + str(fieldTwoNum2)


func _on_calculate_pressed():
	combineNums()
	if operatorIndex == 0: 
		global.result = float(fieldOneCombined) + float(fieldTwoCombined)
	elif operatorIndex == 1: 
		global.result = float(fieldOneCombined) - float(fieldTwoCombined)
	elif operatorIndex == 2: 
		global.result = float(fieldOneCombined) * float(fieldTwoCombined)
	elif operatorIndex == 3: 
		global.result = float(fieldOneCombined) / float(fieldTwoCombined)
	
	if fieldOneCombined == "09" && fieldTwoCombined == "10" && operatorIndex == 0:
		global.result = 21
	global.windowPOS = get_window().position
	$loop.stop()
	$"build up".play()
	applyShake()
	transition.play("fade")
	settingsWindow.hide()
	await get_tree().create_timer(1.78).timeout
	get_tree().change_scene_to_file("res://Scenes/resultScreen.tscn")


func _on_button_pressed():
	$settingsBTN.disabled = true
	settingsWindow.show()


func _on_window_close_requested():
	$settingsBTN.disabled = false
	settingsWindow.hide()
