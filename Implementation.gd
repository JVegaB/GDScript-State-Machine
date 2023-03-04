class_name ExampleNode extends Area;

## properties

var _state_machine := StateMachine.new();

## Godot API

func _ready():
	_state_machine.set_owner(self);
	_state_machine.set_initial_state('Idle');
	_state_machine.add_state('Idle', IdlePlayerState.new());

func _physics_process(delta):
	_state_machine._physics_process(delta);
