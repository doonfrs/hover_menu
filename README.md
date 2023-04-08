## Hover Menu for Flutter
A Flutter package for creating a hover menu for desktop and web applications, providing a common web menu experience.

### Features
- Easy-to-use hover menu that appears when the user hovers over a specified title widget
- Closes the menu when the user stops hovering over the menu or its items
- Customizable

### Installation
To use this package, add hover_menu as a dependency in your pubspec.yaml file.

    dependencies:
      hover_menu: ^1.0.0

Then, run flutter packages get in your terminal.

### Usage
Import the package into your Dart file:

    import 'package:hover_menu/hover_menu.dart';

Create a HoverMenu widget in your app:

    HoverMenu(
      title: Text('Menu Title'),
      items: [
        ListTile(title: Text('Item 1')),
        ListTile(title: Text('Item 2')),
        ListTile(title: Text('Item 3')),
      ],
    )
    
Optionally, you can set a custom width for the menu:

    HoverMenu(
      title: Text('Menu Title'),
      items: [
        ListTile(title: Text('Item 1')),
        ListTile(title: Text('Item 2')),
        ListTile(title: Text('Item 3')),
      ],
      width: 250,
    )

## Example
Here is an example of how to use the HoverMenu widget in your application:
    import 'package:flutter/material.dart';
    import 'package:hover_menu/hover_menu.dart';
    
    void main() {
      runApp(MyApp());
    }
    
    class MyApp extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          home: Scaffold(
            appBar: AppBar(title: Text('Hover Menu Example')),
            body: Center(
              child: HoverMenu(
                title: InkWell(
                  onTap: () {},
                  child: Text('Menu Title'),
                ),
                items: [
                  InkWell(
                    onTap: () {
                      print('Item 1 clicked');
                    },
                    child: ListTile(title: Text('Item 1')),
                  ),
                  InkWell(
                    onTap: () {
                      print('Item 2 clicked');
                    },
                    child: ListTile(title: Text('Item 2')),
                  ),
                  InkWell(
                    onTap: () {
                      print('Item 3 clicked');
                    },
                    child: ListTile(title: Text('Item 3')),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    }
    