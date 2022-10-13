class_name BehaviorTreeSuccess, "icons/confirmed.png"
extends BehaviorTreeDecorator


# ----------------------------------------------------------------------------
func update() -> int:
	return change_status(Status.SUCCESS, Status.SUCESS)
