@tool
@icon("res://addons/TweenAnimation/icon.png")
class_name TweenAnimation extends Node

@export_tool_button("Play") var play_button := play

@export_tool_button("Playback") var play_back_button := playback

@export_group("Child Tween")
@export var is_parallel: bool

var cur_tween: Tween
var is_playback: bool

func _process(delta):
	if Engine.is_editor_hint():
		if cur_tween and cur_tween.is_running():
			cur_tween.custom_step(delta)

func play() -> Tween:
	if cur_tween and cur_tween.is_running():
		cur_tween.kill()
	cur_tween = create_tween()
	is_playback = false
	_create_tweenr(cur_tween)
	return cur_tween

func playback() -> Tween:
	if cur_tween and cur_tween.is_running():
		cur_tween.kill()
	cur_tween = create_tween()
	is_playback = true
	_create_tweenr(cur_tween)
	return cur_tween

func play_tween(not_playback: bool):
	if not_playback:
		play()
	else:
		playback()

func _create_tweenr(tween: Tween):
	_create_child_subtween(tween)

func _create_child_subtween(tween: Tween):
	var child_count = get_child_count()
	if child_count == 0: return
	var index_array = range(0, child_count) if not is_playback else range(child_count - 1, -1, -1)
	var subtween = create_tween()
	tween.tween_subtween(subtween)
	subtween.set_parallel(is_parallel)
	for index in index_array:
		var child_tween: TweenAnimation = get_child(index)
		child_tween.is_playback = is_playback
		child_tween._create_tweenr(subtween)
