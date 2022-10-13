class_name BehaviorTreeWait, "icons/alarm-clock.svg"
extends BehaviorTreeAction


# ----------------------------------------------------------------------------
export (float) var wait_seconds: float = 1.0

var _timer: SceneTreeTimer


# ----------------------------------------------------------------------------
func onInitialize() -> void:
	_timer = get_tree().create_timer(wait_seconds, false)


# ----------------------------------------------------------------------------
func update() -> int:
	if _timer.time_left <= 0.0:
		return Status.SUCCESS
	return Status.RUNNING
