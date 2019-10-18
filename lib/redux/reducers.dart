import 'package:redux_training/model/app_state.dart';
import 'package:redux_training/redux/actions.dart';

AppState reducer(AppState prevState, dynamic action) {
  if (action is FontSizeAction) {
    return AppState.fromAppState(prevState)..sliderFontSize = action.payload;
  } else if (action is BoldAction) {
    return AppState.fromAppState(prevState)..bold = action.payload;
  } else if (action is ItalicAction) {
    return AppState.fromAppState(prevState)..italic = action.payload;
  } else
    throw Exception('invalid action');
}
