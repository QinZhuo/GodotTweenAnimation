@tool
class_name TweenProperty extends TweenValue

@export var node: Node:
	get():
		if not node:
			var parent = get_parent()
			while parent is TweenAnimation:
				parent = parent.get_parent()
			node = parent
		return node

@export var property: String = "scale"

@export_tool_button("Select Property") var select_property := func():
	if Engine.is_editor_hint():
		popup_property_selector.node = node
		popup_property_selector.callback = func(property_path):
			if property_path:
				property = property_path
				final_value = node.get_indexed(property)
				from_value = node.get_indexed(property)
				print(final_value)
				notify_property_list_changed()
		popup_property_selector.run()

func _create_tweenr(tween: Tween):
	_set_tweener_curve(tween.tween_property(node, property, _get_tween_final_value(), _get_tween_duration()))
	super._create_tweenr(tween)

func reset():
	node.set_indexed(property, from_value)
	super.reset()
