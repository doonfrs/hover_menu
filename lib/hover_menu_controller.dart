import 'hover_menu.dart';

class HoverMenuController {
  HoverMenuState? currentState;

  void hideSubMenu() {
    currentState?.hideSubMenu();
  }
}
