# Godot Tween Animation
[English](https://github.com/QinZhuo/GodotTweenAnimation/blob/master/README.md) | [中文](https://github.com/QinZhuo/GodotTweenAnimation/blob/master/zh/README.md)
> 这是一个以节点方式使用 Godot Tween 的插件。一种更方便、更简单的 Tween 使用方法。

[Github](https://github.com/QinZhuo/TweenAnimation) • [资源库](https://godotengine.org/asset-library/asset/4480)
## 优势
* 您可以在编辑器中实时查看 Tween 效果。
* 无需修改代码，即可轻松快速地调整多个复杂 Tween 的顺序和效果。
* 多个 Tween 节点可以另存为场景以便重复使用。
* 支持 Tween 回放，便于创建 UI 动画。
## 使用方法
1. 将文件夹放在您的 Godot 项目的 addons/ 目录中以安装插件
2. 在 项目 > 项目设置 > 插件 中启用该插件
3. 在您的场景中创建一个新的 TweenProperty 节点
![](https://raw.githubusercontent.com/QinZhuo/GodotTweenAnimation/refs/heads/master/images/add_node.png)
4. 配置持续时间、缓动类型和最终值等属性
![](https://raw.githubusercontent.com/QinZhuo/GodotTweenAnimation/refs/heads/master/images/tween_node.png)
5. 点击“播放测试”按钮来显示您的 tween

6. 要进行编程控制，您可以调用 play() 或 playback() 来启动 tween

## 高级功能
* 您可以将多个节点组合成一个复杂的 Tween，其执行顺序由父节点控制。
![](https://raw.githubusercontent.com/QinZhuo/GodotTweenAnimation/refs/heads/master/images/child_tween.png)
* 您可以随时调整 Tween 节点的顺序，以快速修改您的 Tween 动画序列。
* 设置子 tween 是否为并行执行
![](https://raw.githubusercontent.com/QinZhuo/GodotTweenAnimation/refs/heads/master/images/is_parallel.png)
* 默认播放将以反向播放动画。如果您想对曲线或速度进行更多控制，可以勾选“自定义播放 (custom_playback)”选项。
![](https://raw.githubusercontent.com/QinZhuo/GodotTweenAnimation/refs/heads/master/images/playback.png)
* 您可以在编辑器中运行 TweenAnimationEaseTransition 脚本来显示所有的 tween 缓动过渡效果。
![](https://raw.githubusercontent.com/QinZhuo/GodotTweenAnimation/refs/heads/master/images/run_ease_transition.png)
![](https://raw.githubusercontent.com/QinZhuo/GodotTweenAnimation/refs/heads/master/images/ease_transition.png)