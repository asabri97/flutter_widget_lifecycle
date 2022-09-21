import 'package:flutter/material.dart';

import 'life_cycle_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color color = const Color(0XFF28bc6c);
  bool isVisible = true;
  int milliseconds = 300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 200),
            Slider(
              label: '$milliseconds milliseconds',
              activeColor: Colors.white,
              inactiveColor: Colors.white24,
              divisions: 9,
              value: milliseconds.toDouble(),
              onChanged: (newValue) {
                setState(() {
                  milliseconds = newValue.toInt();
                });
              },
              min: 100,
              max: 1000,
            ),
            const SizedBox(height: 50),
            Visibility(
              visible: isVisible,
              child: LifeCycleWidget(
                duration: Duration(milliseconds: milliseconds),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                isVisible = false;
              });
            },
            tooltip: 'Not visible',
            backgroundColor: Colors.white,
            child: Icon(
              Icons.visibility_off_outlined,
              color: color,
              size: 40,
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                isVisible = true;
              });
            },
            tooltip: 'Visible',
            backgroundColor: Colors.white,
            child: Icon(
              Icons.visibility_outlined,
              color: color,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}