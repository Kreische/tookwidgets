import 'package:flutter/material.dart';

class AppBuilder extends StatefulWidget {
  const AppBuilder({Key? key, required this.builder}) : super(key: key);
  final Widget Function(BuildContext) builder;

  @override
  AppBuilderState createState() => AppBuilderState();

  static AppBuilderState? of(BuildContext context) {
    return context.findAncestorStateOfType<AppBuilderState>();
  }
}

class AppBuilderState extends State<AppBuilder> {
  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }

  void rebuild() {
    setState(() {});
  }
}
