class_name BehaviorTreeSequence, "icons/checklist.svg"
extends BehaviorTreeComposite


# ----------------------------------------------------------------------------
func update() -> int:
	return loop_while(Status.SUCCESS)
