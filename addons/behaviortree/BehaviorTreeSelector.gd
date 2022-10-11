class_name BehaviorTreeSelector, "icons/choice.svg"
extends BehaviorTreeComposite


# ----------------------------------------------------------------------------
func update() -> int:
	return loop_while(Status.FAILURE)
