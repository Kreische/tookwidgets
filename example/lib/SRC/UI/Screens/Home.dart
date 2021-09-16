import 'package:flutter/material.dart';
import 'package:tookwidgets/Models/PhoneNumber.dart';
import 'package:tookwidgets/UI/Main/PhoneField.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: PhoneField(
          initialCountry: 'Au',
          onChanged: (PhoneNumber number) {},
        ),
      ),
    );
  }
}
