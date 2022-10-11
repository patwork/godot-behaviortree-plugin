class_name BehaviorTreeRoot, "icons/checkbox-tree.svg"
extends BehaviorTree


# ----------------------------------------------------------------------------
export (NodePath) var actor_node_path: NodePath


# ----------------------------------------------------------------------------
func _ready() -> void:
	assert(_children.size() == 1, "node must have only one child")

	if not actor_node_path.is_empty():
		_actor = get_node_or_null(actor_node_path)
	else:
		_actor = get_parent()
	assert(_actor, "actor must not be null")

	setup(_actor, _blackboard)


# ----------------------------------------------------------------------------
func _physics_process(delta: float) -> void:
	_blackboard['delta'] = delta
	_blackboard['last_status'] = tick()


# ----------------------------------------------------------------------------
func update() -> int:
	assert(is_instance_valid(_children[0]), "child instance is invalid")
	return _children[0].tick()
