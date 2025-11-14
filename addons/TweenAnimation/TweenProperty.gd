@tool
class_name TweenProperty extends TweenAnimation

@export var property: String = "position:x"

@export_tool_button("Select Property") var select_property := func():
	EditorInterface.popup_property_selector(node, func(property_path):
		if property_path:
			property = property_path
			final_value = _get_value()
			from_value = _get_value()
			print(final_value)
			notify_property_list_changed()
	)

@export var final_value: Variant

@export_tool_button("Set Final Value") var set_final_value := func():
	final_value = _get_value()
	print(final_value)
	notify_property_list_changed()

@export var duration: float = 0.5

@export var transition_type: Tween.TransitionType = Tween.TRANS_BACK

@export var ease_type: Tween.EaseType = Tween.EaseType.EASE_OUT

@export_group("Playback")

@export var from_value: Variant
@export var custom_playback: bool:
	set(value):
		if custom_playback == value:
			return
		custom_playback = value
		notify_property_list_changed()

@export var playback_duration: float = 0.2

@export var playback_transition_type: Tween.TransitionType = Tween.TRANS_BACK

@export var playback_ease_type: Tween.EaseType = Tween.EaseType.EASE_OUT

func _get_value():
	return node.get_indexed(property)

func _to_string():
	if get_parent() is TweenAnimation:
		return property.to_pascal_case()
	else:
		return super._to_string()

func create_tweenr(root_tween: Tween, is_play_back: bool = false):
	var tween_value = final_value if not is_play_back else from_value
	var tween_duration := duration
	if is_play_back:
		if custom_playback:
			tween_duration = playback_duration
		else:
			tween_duration /= 2
	elif from_value == null:
		from_value = _get_value()
	var is_custom_playback := is_play_back and custom_playback
	var tweener = root_tween.tween_property(node, property, tween_value, tween_duration)
	tweener.set_trans(transition_type if not is_custom_playback else playback_transition_type)
	tweener.set_ease(ease_type if not is_custom_playback else playback_ease_type)
	super.create_tweenr(root_tween, is_play_back)

func _validate_property(p: Dictionary):
	name = _to_string()
	var p_name: String = p.name
	if p_name.begins_with("playback_") and not custom_playback:
		p.usage = PROPERTY_USAGE_NO_EDITOR
