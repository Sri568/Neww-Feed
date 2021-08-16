
import 'package:flutter/widgets.dart';
import 'package:newsfeed/home/newsparse.dart';


import 'package:flutter/material.dart';
class InheritedDataProvider extends InheritedWidget {

  const InheritedDataProvider({
    Key ?key,
    required this.score,
    required Widget child,
  }) : assert(score != null),
        assert(child != null),
        super(key: key, child: child);

  final List<Datum> score;

  static InheritedDataProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedDataProvider>();
  }

  @override
  bool updateShouldNotify(covariant InheritedDataProvider oldWidget) {
    return oldWidget.score != score;
  }
}