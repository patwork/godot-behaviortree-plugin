class_name BehaviorTreeActiveSelector, "icons/choice-anticlockwise-rotation.svg"
extends BehaviorTreeComposite


# ----------------------------------------------------------------------------
func onInitialize() -> void:
	_current_child = _children.size()


# ----------------------------------------------------------------------------
func update() -> int:
	var previous_child: int = _current_child
	.onInitialize()
	var status: int = loop_while(Status.FAILURE)
	if previous_child != _current_child && previous_child != _children.size():
		assert(is_instance_valid(_children[previous_child]), "child instance is invalid")
		_children[previous_child].abort()
	return status
