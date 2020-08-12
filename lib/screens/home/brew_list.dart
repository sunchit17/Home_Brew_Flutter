import 'package:flutter/material.dart';
import 'package:home_brew/models/brew.dart';
import 'package:provider/provider.dart';
import 'package:home_brew/screens/home/brew_tile.dart';

import 'brew_tile.dart';

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>>(context) ?? [];

    brews.forEach((element) {
      print(element.name);
      print(element.sugars);
      print(element.strength);
    });

    return ListView.builder(
      itemCount: brews.length,
      itemBuilder: (context, index) {
        return BrewTile(brew: brews[index]);
      },
    );
  }
}
