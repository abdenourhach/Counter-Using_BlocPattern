import 'package:equatable/equatable.dart';

abstract class CounterState extends Equatable {}

class InitialState extends CounterState {
  int init;
  InitialState({this.init});

  @override
  List<Object> get props => [];
}

class IncreamentState extends CounterState {
  int counter;
  IncreamentState({this.counter});

  @override
  List<Object> get props => throw UnimplementedError();
}

class LockState extends CounterState {
  @override
  List<Object> get props => [];
}
