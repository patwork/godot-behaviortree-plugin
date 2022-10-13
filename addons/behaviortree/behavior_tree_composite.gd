class_name BehaviorTreeComposite
extends BehaviorTree


# ----------------------------------------------------------------------------
var _current_child: int


# ----------------------------------------------------------------------------
func _init() -> void:
	_current_child = 0


# ----------------------------------------------------------------------------
func _ready() -> void:
	assert(_children.size() > 1, "node must have at least two children")


# ----------------------------------------------------------------------------
func onInitialize() -> void:
	_current_child = 0


# ----------------------------------------------------------------------------
func loop_while(expected: int) -> int:
	var status: int
	while true:
		assert(is_instance_valid(_children[_current_child]), "child instance is invalid")
		status = _children[_current_child].tick()
		if status != expected:
			return status
		_current_child += 1
		if _current_child == _children.size():
			return expected
	return Status.INVALID
