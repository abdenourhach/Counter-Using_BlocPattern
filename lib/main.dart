import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:some_practicebloc/bloc/counter_bloc.dart';
import 'package:some_practicebloc/bloc/counter_events.dart';
import 'package:some_practicebloc/bloc/counter_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider(
          create: (context) => CounterBloc(InitialState(init: 0)),
          child: MyHomePage(),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CounterBloc Bloc;

  @override
  void initState() {
    Bloc = BlocProvider.of<CounterBloc>(context);

    super.initState();
  }

  void dispose() {
    Bloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder(
              builder: (context, state) {
                if (state is InitialState) {
                  return Text('${state.init}');
                } else if (state is IncreamentState) {
                  return Text('${state.counter}');
                } else if (state is LockState) {
                  return Text("locked");
                }
              },
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            heroTag: "b1",
            onPressed: () {
              Bloc.add(IncreamentEvents());
            },
            tooltip: 'Increament',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: "b2",
            onPressed: () {
              Bloc.add(lockEvents());
            },
            tooltip: 'lock',
            child: const Icon(Icons.lock),
          ),
        ],
      ),
    );
  }
}
