import 'package:docker_study/main.dart';
import 'package:flutter/material.dart';

import 'bloc.dart';

class Provider extends InheritedWidget {
  final Bloc bloc = Bloc();

  Provider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static Provider of(BuildContext context) 
    => (context.inheritFromWidgetOfExactType(Provider) as Provider);
}