class_name BehaviorTreeLeaf
extends BehaviorTree


# ----------------------------------------------------------------------------
func _ready() -> void:
	assert(_children.size() == 0, "node can't have children")
