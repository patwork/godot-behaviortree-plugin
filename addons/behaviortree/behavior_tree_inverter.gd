class_name BehaviorTreeInverter, "icons/interdiction.png"
extends BehaviorTreeDecorator


# ----------------------------------------------------------------------------
func update() -> int:
	return change_status(Status.FAILED, Status.SUCCESS)
