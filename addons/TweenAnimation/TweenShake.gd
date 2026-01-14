@tool
class_name TweenShake extends TweenProperty

@export var noise: Noise
@export var scale_curve: Curve

func _init() -> void:
	noise = FastNoiseLite.new()
	noise.noise_type = FastNoiseLite.NoiseType.TYPE_VALUE
	noise.fractal_type = FastNoiseLite.FractalType.FRACTAL_NONE

func _get_noise_1d(cur_time: float, index: int = 0) -> float:
	return noise.get_noise_1d((cur_time + index) * 10000)

func _get_noise_2d(cur_time: float) -> Vector2:
	return Vector2(_get_noise_1d(cur_time, 0), _get_noise_1d(cur_time, 1))

func _get_noise_3d(cur_time: float) -> Vector3:
	return Vector3(_get_noise_1d(cur_time, 0), _get_noise_1d(cur_time, 1), _get_noise_1d(cur_time, 2))

func _create_tweenr(tween: Tween):
	var offset = final_value - from_value
	var time := _get_tween_duration()
	var start := randf()
	_set_tweener_curve(tween.tween_method(func(cur_time: float):
		var p := cur_time / time
		var scale := (1.0 - p) if not scale_curve else scale_curve.sample(p)
		if offset is float:
			node.set_indexed(property, from_value + _get_noise_1d(start + cur_time) * offset * scale)
		if offset is Vector2:
			node.set_indexed(property, from_value + _get_noise_2d(start + cur_time) * offset * scale)
		if offset is Vector3:
			node.set_indexed(property, from_value + _get_noise_3d(start + cur_time) * offset * scale)
		, 0.0, time, time))
	_create_child_subtween(tween)
