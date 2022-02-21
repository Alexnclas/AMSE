import 'package:flutter/foundation.dart';

//Change notifier
class animationButtonChange extends ChangeNotifier {
  double _valueSlider1 = 2.0;
  double _valueSlider2 = 2.0;
  double _valueSlider3 = 2.0;

  double get valueSlider1 => _valueSlider1;
  double get valueSlider2 => _valueSlider2;
  double get valueSlider3 => _valueSlider3;

  set valueSlider1(double newValue){
    _valueSlider1 = newValue;
    notifyListeners();
  }
  set valueSlider2(double newValue){
    _valueSlider2 = newValue;
    notifyListeners();
  }
  set valueSlider3(double newValue){
    _valueSlider3 = newValue;
    notifyListeners();
  }
}