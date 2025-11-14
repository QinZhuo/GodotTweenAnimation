@tool
class_name TweenPropertyArray extends TweenProperty

@export var final_values: Array[Variant]

@export_tool_button("Add Final Value") var add_final_value := func():
	final_values.append(_get_value())
	print(final_value)
	notify_property_list_changed()

func create_property_tweenr(tween: Tween, is_play_back: bool = false):
	var subtween = create_tween()
	tween.tween_subtween(subtween)
	var from = from_value
	var value_indexs: Array = range(0, final_values.size()) if not is_play_back else range(final_values.size() - 2, -1, -1)
	var tween_duration := duration / final_values.size()
	if is_play_back:
		if custom_playback:
			tween_duration = playback_duration / final_values.size()
		else:
			tween_duration /= 2
	elif from_value == null:
		from_value = _get_value()
	for index in value_indexs:
		var to = final_values[index]
		subtween.tween_property(node, property, to, tween_duration)
	if is_play_back:
		subtween.tween_property(node, property, from, tween_duration)
	var is_custom_playback := is_play_back and custom_playback
	subtween.set_trans(transition_type if not is_custom_playback else playback_transition_type)
	subtween.set_ease(ease_type if not is_custom_playback else playback_ease_type)

func _validate_property(p: Dictionary):
	super._validate_property(p)
	var p_name: String = p.name
	if p_name == "final_value" or p.name == "set_final_value":
		p.usage = PROPERTY_USAGE_NO_EDITOR
