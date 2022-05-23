import 'dart:html';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:some_practicebloc/bloc/counter_events.dart';
import 'package:some_practicebloc/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvents, CounterState> {
  int counter = 0;

  CounterBloc(CounterState initialState) : super(initialState);

  @override
  Stream<CounterState> mapEventToState(CounterEvents events) async* {
    if (Event is IncreamentEvents) {
      yield IncreamentState(counter: counter++);
    } else if (events is lockEvents) {
      yield LockState();
    }
  }
}
