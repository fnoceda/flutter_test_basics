// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  _CounterViewState createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              key: const Key('abc'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Scaffold(
                      appBar: AppBar(),
                      body: const Center(
                        child: Text('abc'),
                      ),
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.abc))
        ],
      ),
      body: Center(
        child: Text(
          '$_counter',
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
      ),
      floatingActionButton: _counter < 5
          ? Row(
              children: [
                FloatingActionButton(
                  heroTag: 'KeyButton',
                  key: const Key('KeyButton'),
                  onPressed: _increment,
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  heroTag: 'KeyButton2',
                  key: const Key('KeyButton2'),
                  onPressed: _increment,
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  heroTag: 'KeyButton3',
                  key: const Key('KeyButton3'),
                  onPressed: _increment,
                  child: const Icon(Icons.add),
                ),
              ],
            )
          : null,
    );
  }
}
