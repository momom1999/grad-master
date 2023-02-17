import 'package:flutter/material.dart';

class MyTheme {

  final Color backgroundColor = Colors.teal;
  final Text title;
  final AppBar appBar;

  const MyTheme(this.title, this.appBar,);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      backgroundColor: backgroundColor,
    );
  }
}

@override
Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: Text('Paws'),
      ),
      body: Container());
}

