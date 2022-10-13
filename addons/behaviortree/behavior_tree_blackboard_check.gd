class_name BehaviorTreeBlackboardCheck, "icons/teacher-uncertainty.png"
extends BehaviorTreeCondition


# ----------------------------------------------------------------------------
export (String) var key_name: String
export (String) var compare_string: String
export (bool) var compare_boolean: bool


# ----------------------------------------------------------------------------
func _ready() -> void:
	assert(not key_name.empty())


# ----------------------------------------------------------------------------
func update() -> int:
	if key_name in _blackboard and _blackboard[key_name] != null:
		if not compare_string.empty():
			if _blackboard[key_name] == compare_string:
				return Status.SUCCESS
		else:
			if _blackboard[key_name] == compare_boolean:
				return Status.SUCCESS
	return Status.FAILURE
