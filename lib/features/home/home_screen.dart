import 'package:flutter/material.dart';
import '/common/translations/translations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(LocaleKeys.home.tr())),
    );
  }
}
