# Godot Tween Animation 

> This is a plugin for using Godot Tween in a node-based way. A more convenient and simpler way to use Tween.
* [Github](https://github.com/QinZhuo/TweenAnimation) 
* [Asset library](https://godotengine.org/asset-library/asset/4480) 
## Advantage
* You can view the Tween effects in real-time in the editor.
* Easily and quickly adjust the order and effects of multiple complex Tweens without modifying code.
* Multiple Tween Nodes can be saved as scenes for reuse.
* Supports Tween replay for easy UI animation creation.
## Usage
1. Install the plugin by placing the folder in your Godot project's addons/ directory
2. Enable the plugin in Project > Project Settings > Plugins
3. Create a new TweenProperty node in your scene
![](https://raw.githubusercontent.com/QinZhuo/TweenAnimation/refs/heads/master/images/add_node.png)
4. Configure properties like duration, ease_type, and final_value
![](https://raw.githubusercontent.com/QinZhuo/TweenAnimation/refs/heads/master/images/tween_node.png) 
5. Click Play Test button to show your tween

6. For programmatic control, you can call play() or playback() to start the tween

## Advanced
* You can combine multiple nodes into a complex Tween where the execution order is controlled by parent nodes. 
![](https://raw.githubusercontent.com/QinZhuo/TweenAnimation/refs/heads/master/images/child_tween.png)
* You can adjust the order of Tween nodes at any time to quickly modify your Tween animation sequence.
* Set child tween is_parallel or not
![](https://raw.githubusercontent.com/QinZhuo/TweenAnimation/refs/heads/master/images/is_parallel.png)
* Default playback will play the animation in reverse. If you want more control over curves or speed, you can check the 'custom_playback' option.
![](https://raw.githubusercontent.com/QinZhuo/TweenAnimation/refs/heads/master/images/playback.png)
* You can run the TweenAnimationEaseTransition script in the editor to display all tween ease transition effects.
![](https://raw.githubusercontent.com/QinZhuo/TweenAnimation/refs/heads/master/images/run_ease_transition.png)
![](https://raw.githubusercontent.com/QinZhuo/TweenAnimation/refs/heads/master/images/ease_transition.png)
![](https://raw.githubusercontent.com/QinZhuo/TweenAnimation/refs/heads/master/images/ease_transition.git)