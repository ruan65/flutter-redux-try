import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_training/drawer_menu.dart';
import 'package:redux_training/redux/actions.dart';

import 'model/app_state.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Settings'),
      ),
      drawer: DrawerMenu(),
      body: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: Text(
                'Font Size: ${state.sliderFontSize.toInt()}',
                style: TextStyle(
                    fontSize: Theme.of(context).textTheme.headline.fontSize),
              ),
            ),
            Slider(
                min: 0.5,
                value: state.sliderFontSize,
                onChanged: (newValue) {
                  StoreProvider.of<AppState>(context)
                      .dispatch(FontSizeAction(newValue));
                }),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: <Widget>[
                  Checkbox(
                    value: state.bold,
                    onChanged: (newVal) {
                      StoreProvider.of<AppState>(context)
                          .dispatch(BoldAction(newVal));
                    },
                  ),
                  Text(
                    'Bold',
                    style: getStyle(state.bold, false),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: <Widget>[
                  Checkbox(
                      value: state.italic,
                      onChanged: (newVal) {
                        StoreProvider.of<AppState>(context)
                            .dispatch(ItalicAction(newVal));
                      }),
                  Text(
                    'Italic',
                    style: getStyle(state.bold, state.italic),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle getStyle([bool isBold = false, bool isItalic = false]) {
    return TextStyle(
      fontSize: 18,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
    );
  }
}
