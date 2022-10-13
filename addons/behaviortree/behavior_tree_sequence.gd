class_name BehaviorTreeSequence, "icons/checklist.png"
extends BehaviorTreeComposite


# ----------------------------------------------------------------------------
func update() -> int:
	return loop_while(Status.SUCCESS)
