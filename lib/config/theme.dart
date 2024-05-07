import 'package:fluent_ui/fluent_ui.dart';

//主题（颜色和字体）
class ThemeModel extends ChangeNotifier {
  AccentColor _color = Colors.purple;

  AccentColor get color => _color;

  set color(AccentColor color) {
    _color = color;
    notifyListeners();
  }

  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  set locale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }
}
