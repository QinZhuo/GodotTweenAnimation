@tool
class_name TweenShake extends TweenValue

@export var node: Node:
	get():
		if not node:
			var parent = get_parent()
			while parent is TweenAnimation:
				parent = parent.get_parent()
			node = parent
		return node

@export var property: String = "scale"

static var popup_property_selector: RefCounted:
	get():
		if not popup_property_selector:
			var script = GDScript.new()
			script.source_code = "
extends EditorScript
var node:Node
var callback:Callable
func run():
	EditorInterface.popup_property_selector(node, callback)
			"
			script.reload()
			popup_property_selector = script.new()
		return popup_property_selector

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

@export var frequency: float = 20.0

func _create_tweenr(tween: Tween):
	var subtween := create_tween()
	var offset = final_value - from_value
	var delta := 1 / frequency
	var cur_time := delta
	while cur_time < duration:
		if offset is float:
			tween.tween_property(node, property, from_value + randf_range(-1, 1) * offset, delta)
		if offset is Vector2:
			tween.tween_property(node, property, from_value + Vector2(randf_range(-1, 1), randf_range(-1, 1)) * offset, delta)
		if offset is Vector3:
			tween.tween_property(node, property, from_value + Vector3(randf_range(-1, 1), randf_range(-1, 1), randf_range(-1, 1)) * offset, delta)
		cur_time += delta

	# 最后确保回到原位
	tween.tween_property(node, property, from_value, delta)

	_set_tweener_curve(tween.tween_subtween(subtween))
	super._create_tweenr(tween)
