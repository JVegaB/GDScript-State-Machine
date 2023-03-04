class_name StateMachine extends Reference;

var _states: Dictionary = {};
var _current: String;
var _owner;

## Setup methods

func set_owner(owner):
	_owner = owner;

func set_initial_state(name: String):
	_current = name;

func add_state(name: String, state: State):
	state.set_owner(_owner)
	_states[name] = state;

## Engine methods

func switch_to_state(new_state: String):
	_states[_current].exit(new_state);
	var old_state = _current;
	_current = new_state;
	_states[_current].enter(old_state);

func _physics_process(delta):
	var new_state = _states[_current]._physics_process(delta);
	if new_state:
		switch_to_state(new_state);

func ready():
	_states[_current].enter(null);
