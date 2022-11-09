import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'features/home/home_screen.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => const HomeScreen(),
};
