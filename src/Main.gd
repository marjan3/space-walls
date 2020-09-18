extends WorldEnvironment

onready var results: Label = $UI/Results
onready var ball = $Ball
onready var enemies_counter_lbl: Label = $UI/EnemiesCounter/EnemiesCounterLabel
onready var enemies_total_size = get_tree().get_nodes_in_group("enemies").size()
onready var ui: Node = $UI

func _ready() -> void:
	enemies_counter_lbl.text = "ENEMIES:  " + str(enemies_total_size)

func _on_Walls_ball_exited() -> void:
	results.set_text("Mission failed")
	ui.pause_timer()
	results.show()

func _on_Ball_enemy_touched(enemy, extra_arg):
	enemy.free()
	
	# todo: propagate update to UI
	var enemies = get_tree().get_nodes_in_group("enemies")
	var enemies_current_size = enemies.size()
	enemies_counter_lbl.text = "ENEMIES:  " + str(enemies_current_size)
	
	if(enemies_current_size == 0.0):
		results.set_text("Congratulations!\nYou Won!")
		ui.pause_timer()
		results.show()
		get_tree().paused = true
