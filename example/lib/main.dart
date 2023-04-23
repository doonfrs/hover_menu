import 'package:flutter/material.dart';
import 'package:hover_menu/hover_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hover Menu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Hover Menu'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.black, width: 1))),
            height: 50,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                HoverMenu(
                  title: Text('Main', style: TextStyle(color: Colors.black)),
                  items: [
                    ListTile(
                      mouseCursor: SystemMouseCursors.click,
                      title: Text(
                        'Sub',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ListTile(
                      mouseCursor: SystemMouseCursors.click,
                      title: Text(
                        'Sub 2',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
                HoverMenu(
                  title: Text('Menu 2', style: TextStyle(color: Colors.black)),
                  items: [
                    ListTile(
                      mouseCursor: SystemMouseCursors.click,
                      title: Text(
                        'Sub 2',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ListTile(
                      mouseCursor: SystemMouseCursors.click,
                      title: Text(
                        'Sub 3',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
                VerticalDivider(
                  width: 2,
                  thickness: 1,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          const Expanded(
              child: Center(
            child: Text('Hover Menu'),
          ))
        ],
      ),
    );
  }
}
