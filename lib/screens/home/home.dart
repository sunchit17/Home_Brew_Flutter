import 'package:flutter/material.dart';
import 'package:home_brew/models/brew.dart';
import 'package:home_brew/screens/home/brew_list.dart';
import 'package:home_brew/screens/home/settings_form.dart';
import 'package:home_brew/services/auth.dart';
import 'package:home_brew/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingsForm(),
            );
          });
    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          title: Text('Home Brew'),
          backgroundColor: Colors.brown[500],
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings_power),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
            IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  _showSettingsPanel();
                }),
          ],
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/coffee_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: BrewList()),
      ),
    );
  }
}
