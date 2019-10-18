import 'package:flutter/foundation.dart';

class AppState {
  double sliderFontSize;
  bool bold;
  bool italic;

  AppState(
      {@required this.sliderFontSize, this.bold = false, this.italic = false});

  AppState.fromAppState(AppState another) {
    sliderFontSize = another.sliderFontSize;
    bold = another.bold;
    italic = another.italic;
  }

  get viewFontSize => sliderFontSize * 30;

  @override
  String toString() {
    return 'AppState{sliderFontSize: $sliderFontSize, bold: $bold, italic: $italic}';
  }


}
