class_name BehaviorTreeBlackboardSet, "icons/teacher.png"
extends BehaviorTreeAction


# ----------------------------------------------------------------------------
export (String) var key_name: String
export (String) var set_string: String
export (bool) var set_boolean: bool
export (bool) var delete: bool


# ----------------------------------------------------------------------------
func _ready() -> void:
	assert(not key_name.empty())


# ----------------------------------------------------------------------------
func update() -> int:
	if delete:
		_blackboard.erase(key_name)
	else:
		if not set_string.empty():
			_blackboard[key_name] = set_string
		else:
			_blackboard[key_name] = set_boolean
	return Status.SUCCESS
