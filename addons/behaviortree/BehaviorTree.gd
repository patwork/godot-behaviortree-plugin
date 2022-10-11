class_name BehaviorTree
extends Node


# ----------------------------------------------------------------------------
enum Status {
	INVALID,
	SUCCESS,
	FAILURE,
	RUNNING,
	ABORTED
}

var _status: int
var _children: Array
var _actor: Node
var _blackboard: Dictionary


# ----------------------------------------------------------------------------
func _init() -> void:
	_status = Status.INVALID
	_children.clear()
	_actor = null
	_blackboard.clear()


# ----------------------------------------------------------------------------
func _ready() -> void:
	if get_child_count():
		for child in get_children():
			assert(child.has_method("update"), "node must have update() function")
			_children.append(child)


# ----------------------------------------------------------------------------
func setup(actor, blackboard) -> void:
	_actor = actor
	_blackboard = blackboard

	if not _children.empty():
		for child in _children:
			assert(child.has_method("setup"), "node must have setup() function")
			child.setup(actor, blackboard)


# ----------------------------------------------------------------------------
func tick() -> int:
	if _status != Status.RUNNING:
		onInitialize()
	_status = update()
	if _status != Status.RUNNING:
		onTerminate(_status)
	return _status


# ----------------------------------------------------------------------------
func onInitialize() -> void:
	pass


# ----------------------------------------------------------------------------
func update() -> int:
	assert(false, "virtual update() function call")
	return Status.INVALID


# ----------------------------------------------------------------------------
func onTerminate(_sts: int) -> void:
	pass


# ----------------------------------------------------------------------------
func reset() -> void:
	_status = Status.INVALID


# ----------------------------------------------------------------------------
func abort() -> void:
	onTerminate(Status.ABORTED)
	_status = Status.ABORTED


# ----------------------------------------------------------------------------
func isTerminated() -> bool:
	return _status == Status.SUCCESS || _status == Status.FAILURE


# ----------------------------------------------------------------------------
func isRunning() -> bool:
	return _status == Status.RUNNING


# ----------------------------------------------------------------------------
func getStatus() -> int:
	return _status


# ----------------------------------------------------------------------------
func debug() -> void:
	print(self)
	print(_status)
	print(_children)
	print(_actor)
	print(_blackboard)
	print("")
