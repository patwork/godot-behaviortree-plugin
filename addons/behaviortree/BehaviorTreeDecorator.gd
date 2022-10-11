class_name BehaviorTreeDecorator, "icons/large-paint-brush.svg"
extends BehaviorTreeLeaf


# ----------------------------------------------------------------------------
func change_status(on_success: int, on_failure: int):
	assert(is_instance_valid(_children[0]), "child instance is invalid")
	var status: int = _children[0].tick()
	if status == Status.SUCCESS:
		return on_success
	if status == Status.FAILURE:
		return on_failure
	return status
