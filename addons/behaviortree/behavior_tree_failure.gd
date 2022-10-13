class_name BehaviorTreeFailure, "icons/cancel.png"
extends BehaviorTreeDecorator


# ----------------------------------------------------------------------------
func update() -> int:
	return change_status(Status.FAILED, Status.FAILED)
