@tool
class_name TweenShake extends TweenProperty

@export var offset_value: Variant:
	get(): return final_value
	set(value): final_value = value
@export var noise: Noise
@export var scale_curve: Curve
@export var intensity: float = 1
var noise_pos: float
var last_time: float
func _init() -> void:
	noise = FastNoiseLite.new()
	noise.fractal_type = FastNoiseLite.FractalType.FRACTAL_NONE

func _get_noise_1d(cur_time: float, index: int = 0) -> float:
	return noise.get_noise_1d((cur_time + index) * 1000)

func _get_noise_2d(cur_time: float) -> Vector2:
	return Vector2(_get_noise_1d(cur_time, 0), _get_noise_1d(cur_time, 1))

func _get_noise_3d(cur_time: float) -> Vector3:
	return Vector3(_get_noise_1d(cur_time, 0), _get_noise_1d(cur_time, 1), _get_noise_1d(cur_time, 2))

func _create_tweenr(tween: Tween):
	var offset = offset_value
	var time := _get_tween_duration()
	_set_tweener_curve(tween.tween_method(func(cur_time: float):
		var p := cur_time / time
		if cur_time > last_time:
			noise_pos += cur_time - last_time
		last_time = cur_time
		var scale := intensity * ((1.0 - p) if not scale_curve or is_playback else scale_curve.sample(p))
		if offset is float:
			node.set_indexed(property, from_value + _get_noise_1d(noise_pos) * offset * scale)
		if offset is Vector2:
			node.set_indexed(property, from_value + _get_noise_2d(noise_pos) * offset * scale)
		if offset is Vector3:
			node.set_indexed(property, from_value + _get_noise_3d(noise_pos) * offset * scale)
		, 0.0, time, time))
	_create_child_subtween(tween)

func _validate_property(p: Dictionary) -> void:
	var p_name: String = p.name
	if p_name == "final_value":
		p.usage = PROPERTY_USAGE_NO_EDITOR
