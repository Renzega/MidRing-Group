import 'package:flutter/material.dart';
import 'views/home.dart';

void main() {
  runApp(const LeDuel2022());
}

class LeDuel2022 extends StatelessWidget {
  const LeDuel2022({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Le Duel 2022',
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}