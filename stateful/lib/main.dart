import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  var numbers = [];
  int count = 0;

  void onClicked() {
    setState(() {
      numbers.add(count++);
    });
  }

  void onDelete(int number) {
    setState(() {
      numbers.remove(number);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Click Count',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  )),
              const SizedBox(
                height: 10,
              ),
              for (var number in numbers)
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text('$number '),
                  const Text('board'),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () => onDelete(number),
                    icon: const Icon(Icons.delete_forever_sharp),
                  ),
                ]),
              const SizedBox(
                height: 30,
              ),
              IconButton(
                iconSize: 50,
                onPressed: onClicked,
                icon: const Icon(
                  Icons.add_box_rounded,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
