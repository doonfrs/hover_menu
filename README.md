## Hover Menu for Flutter
A Flutter package for creating a hover menu for desktop and web applications, providing a common web menu experience.

![Hover Menu Usage Example](https://raw.githubusercontent.com/doonfrs/hover_menu/cb0f0abda152ccfaf05fb9f075f9a8a903c406f9/example/assets/example.gif)

### Features
- Easy-to-use hover menu that appears when the user hovers over a specified title widget
- Closes the menu when the user stops hovering over the menu or its items
- Customizable

### Installation
To use this package, add hover_menu as a dependency in your pubspec.yaml file.
```yaml
dependencies:
  hover_menu: ^1.1.1
```
Then, run flutter packages get in your terminal.

### Usage
Import the package into your Dart file:
```dart
import 'package:hover_menu/hover_menu.dart';
```
Create a HoverMenu widget in your app:
```dart
HoverMenu(
  title: Text('Menu Title'),
  items: [
    ListTile(title: Text('Item 1')),
    ListTile(title: Text('Item 2')),
    ListTile(title: Text('Item 3')),
  ],
)
```
Optionally, you can set a custom width for the menu:
```dart
HoverMenu(
  title: Text('Menu Title'),
  items: [
    ListTile(title: Text('Item 1')),
    ListTile(title: Text('Item 2')),
    ListTile(title: Text('Item 3')),
  ],
  width: 250,
)
```
## Example
Here is an example of how to use the HoverMenu widget in your application:
```dart
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
```
## Example
Using HoverMenuLastItem
If we have five menu items that are horizontally aligned and need to provide dropdown options for the last menu item, the dropdown size extends beyond the screen boundaries. To address this issue, I am working on a solution where the dropdown portion aligns precisely with the end of the menu option and stretches towards the opposite side. Users can call the new class specifically for the last menu option.

As shown in the screenshot, the dropdown position for the last menu item was previously extending beyond the screen boundaries. I resolved this by adjusting the positioning exclusively for the last menu option.
![Last Menu Usage Example](https://raw.githubusercontent.com/doonfrs/hover_menu/main/example/assets/example-last-item.png)
Instead of using HoverMenu class for the last menu item, use HoverMenuLastItem.
```dart
HoverMenuLastItem(
title: HoverText("Company"),
items: ...
width: 500,
),
```


### Limitation
- I do not recommend using this package for mobile applications, as the standard Drawer and AppBar provide a better user experience. Consider using an 'if' condition.
Something like:
```dart
bool isDesktopOrWeb() {
  if (kIsWeb) {
    return true;
  }
  if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
    return true;
  }

  return false;
}
```
And in your build:
```dart
Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: isDesktopOrWeb() ? null : AppBar(title: Text('Conditional Widget Example')),
        drawer: isDesktopOrWeb() ? null : MyDrawer(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isDesktopOrWeb()) HoverMenu(
                  title: Text('Menu Title'),
                  items: [
                    ListTile(title: Text('Item 1')),
                    ListTile(title: Text('Item 2')),
                    ListTile(title: Text('Item 3')),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
```

### Developer
This package is developed by Feras Abdalrahman.

### License
```
This package is released under the MIT license.
MIT License

Copyright (c) 2023 FERAS ABDALRAHMAN

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```
