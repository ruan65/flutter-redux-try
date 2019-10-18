import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_training/drawer_menu.dart';

import 'model/app_state.dart';

const kAppTitle = 'States by Redux';
const kStateType = '...';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kAppTitle),
        backgroundColor: Colors.teal,
      ),
      drawer: DrawerMenu(),
      body: Container(
        margin: EdgeInsets.all(10),
        child: StoreConnector<AppState, AppState>(
          converter: (store) => store.state,
          builder: (context, state) => RichText(
            text: TextSpan(
              text: lorem(paragraphs: 3, words: 50),
              style: TextStyle(
                fontSize: state.viewFontSize,
                color: Colors.black,
                fontWeight: state.bold ? FontWeight.bold : FontWeight.normal,
                fontStyle: state.italic ? FontStyle.italic : FontStyle.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
