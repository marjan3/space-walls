extends Control

export (PackedScene) var gameScreen

onready var main_menu_buttons = get_node("./MainMenuButtons")
onready var start_game_buttons = get_node("./StartGameButtons")
onready var version_label = get_node("./VersionLabel")
onready var credits_screen = get_node("./CreditsScreen")
onready var animation_player = get_node("AnimationPlayer")

# Called when the node enters the scene tree for the first time.
func _ready():
	version_label.text = "0.1v"
	credits_screen.connect("exited", self, "_on_CreditsScreen_exited")

func _on_ContinueButton_pressed():
	assert(gameScreen)
	
	animation_player.play("fade_out")
	yield(animation_player, "animation_finished")
	get_tree().change_scene_to(gameScreen)

func _on_NewGameButton_pressed():
	assert(gameScreen)
	
	animation_player.play("fade_out")
	yield(animation_player, "animation_finished")
	get_tree().change_scene_to(gameScreen)
	
func _on_OptionsButton_pressed():
	pass # Replace with function body.

func _on_CreditsButton_pressed():
	animation_player.play("fade_out")
	yield(animation_player, "animation_finished")
	credits_screen.show()
	main_menu_buttons.hide()
	animation_player.play("fade_in")
	yield(animation_player, "animation_finished")

func _on_CreditsScreen_exited():
	credits_screen.hide()
	main_menu_buttons.show()
	
func _on_StartGameButton_pressed():
	animation_player.play("fade_out")
	main_menu_buttons.hide()
	start_game_buttons.show()
	animation_player.play("fade_in")

func _on_BackButton_pressed():
	animation_player.play("fade_in")
	main_menu_buttons.show()
	start_game_buttons.hide()

func _on_QuitButton_pressed():
	animation_player.play("fade_out")
	get_tree().quit()
