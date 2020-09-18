extends Node

onready var timer_counter: Node = $TimeCounter;

func pause_timer():
	timer_counter.pause()

