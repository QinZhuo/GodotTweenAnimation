@tool
class_name TweenPropertyArray extends TweenProperty

@export var final_values: Array[Variant]

@export_tool_button("Add Final Value") var add_final_value := func():
	final_values.append(node.get_indexed(property))
	print(final_value)
	notify_property_list_changed()

func _create_tweenr(tween: Tween):
	var subtween := create_tween()
	tween.tween_subtween(subtween)
	var from = from_value
	var value_indexs: Array = range(0, final_values.size()) if not is_playback else range(final_values.size() - 2, -1, -1)
	var tween_duration := _get_tween_duration() / final_values.size()
	for index in value_indexs:
		var to = final_values[index]
		subtween.tween_property(node, property, to, tween_duration)
	if is_playback:
		subtween.tween_property(node, property, from, tween_duration)
	if transition_type:
		subtween.set_trans(transition_type)
		subtween.set_ease(ease_type)
	_create_child_subtween(tween)

func _validate_property(p: Dictionary):
	var p_name: String = p.name
	if p_name == "final_value":
		p.usage = PROPERTY_USAGE_NO_EDITOR
