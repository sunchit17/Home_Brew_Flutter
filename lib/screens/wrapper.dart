import 'package:flutter/material.dart';
import 'package:home_brew/models/user.dart';
import 'package:home_brew/screens/authenticate/authenticate.dart';
import 'package:home_brew/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    
    if(user == null){
      return Authenticate();
    }else{
      return Home();
    }
  }
}