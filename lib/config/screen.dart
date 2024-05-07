import 'package:fluent_ui/fluent_ui.dart';

//屏幕适配
class ScreenModel extends ChangeNotifier {
  double _maxWidth = 0;
  double _maxHeight = 0;

  double get maxWidth => _maxWidth;

  double get maxHeight => _maxHeight;

  void dimension(double maxWidth, double maxHeight) {
    _maxWidth = maxWidth;
    _maxHeight = maxHeight;
    notifyListeners();
  }

  double widthRatio(double ratio) {
    return _maxWidth * ratio;
  }

  double heightRatio(double ratio) {
    return _maxHeight * ratio;
  }
// 不改变的尺寸

}
