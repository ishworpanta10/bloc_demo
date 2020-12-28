import 'package:bloc_demo/logic/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen "),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.isIncrement == true) {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(microseconds: 300),
                      content: Text('Incremented'),
                    ),
                  );
                } else {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(microseconds: 300),
                      content: Text('Decremented'),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state.counterValue < 0) {
                  return Text(
                    'Oops ! Negative Value\n ${state.counterValue.toString()} ',
                    style: Theme.of(context).textTheme.headline4,
                    textAlign: TextAlign.center,
                  );
                }
                if (state.counterValue % 2 == 0) {
                  return Text(
                    'Even Value\n ${state.counterValue.toString()} ',
                    style: Theme.of(context).textTheme.headline4,
                    textAlign: TextAlign.center,
                  );
                }
                return Text(
                  state.counterValue.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            SizedBox(height: 100),
            MaterialButton(
              color: Colors.teal.withOpacity(0.6),
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Exit",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            heroTag: null,
            onPressed: () {
              context.read<CounterCubit>().increment();
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            heroTag: null,
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).decrement();
            },
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
