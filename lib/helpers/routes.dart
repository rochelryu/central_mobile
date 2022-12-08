import 'package:flutter/material.dart';

import '../pages/details_transaction.dart';
import '../pages/home.dart';
import '../pages/homescreen.dart';
import '../pages/login.dart';

final routes = {
  Login.routeName: (context) => Login(key: UniqueKey()),
  Home.routeName: (context) => Home(key: UniqueKey()),
  DetailsTransaction.routeName: (context) => DetailsTransaction(key: UniqueKey()),
  Homescreen.routeName: (context) => Homescreen(key: UniqueKey()),
};
