class_name BehaviorTreeSelector, "icons/choice.png"
extends BehaviorTreeComposite


# ----------------------------------------------------------------------------
func update() -> int:
	return loop_while(Status.FAILURE)
