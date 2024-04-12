extends OptionButton

@export var option1:OptionButton
@export var option2:OptionButton
@export var option3:OptionButton
@export var option4:OptionButton
@export var option5:OptionButton

func _ready():
	
	option1.get_popup().transparent_bg = true
	option2.get_popup().transparent_bg = true
	option3.get_popup().transparent_bg = true
	option4.get_popup().transparent_bg = true
	option5.get_popup().transparent_bg = true
