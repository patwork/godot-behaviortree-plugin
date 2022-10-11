class_name BehaviorTreeSuccess, "icons/confirmed.svg"
extends BehaviorTreeDecorator


# ----------------------------------------------------------------------------
func update() -> int:
	return change_status(Status.SUCCESS, Status.SUCESS)
