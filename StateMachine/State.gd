class_name State extends Reference;

var _previous_state: String;
var _owner;

func _physics_process(delta):
	pass

func enter(previous_state: String):
	_previous_state = previous_state

func exit(next_state):
	pass

func set_owner(owner):
	_owner = owner;
