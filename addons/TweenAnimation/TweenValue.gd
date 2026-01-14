@tool
@abstract
class_name TweenValue extends TweenAnimation

@export var from_value: Variant

@export var final_value: Variant

@export var duration: float = 0.3

@export var playback_duration: float = 0.2

@export var transition_type: Tween.TransitionType = Tween.TRANS_LINEAR

@export var ease_type: Tween.EaseType = Tween.EaseType.EASE_OUT

func _get_tween_from_value():
	return from_value if not is_playback else final_value

func _get_tween_final_value():
	return final_value if not is_playback else from_value

func _get_tween_duration() -> float:
	var tween_duration := duration if not is_playback else playback_duration
	return tween_duration

func _set_tweener_curve(tweener: Tweener):
	if not transition_type:
		return
	tweener.set_trans(transition_type)
	tweener.set_ease(ease_type)

func reset_value(new_from_value: Variant):
	from_value = new_from_value
	reset()
