import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_training/drawer_menu.dart';

import 'model/app_state.dart';

class About extends StatelessWidget {
  String text = lorem(paragraphs: 3, words: 50);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        backgroundColor: Colors.teal,
      ),
      drawer: DrawerMenu(),
      body: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) => Container(
          margin: EdgeInsets.all(10.0),
          child: RichText(
            text: TextSpan(
              text: text,
              style: TextStyle(
                fontSize: state.viewFontSize,
                fontWeight: state.bold ? FontWeight.bold : FontWeight.normal,
                fontStyle: state.italic ? FontStyle.italic : FontStyle.normal,
                color: Colors.lightBlue,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
