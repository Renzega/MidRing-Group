import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'views/home.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const LeDuel2022());
}

class LeDuel2022 extends StatelessWidget {
  const LeDuel2022({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return const MaterialApp(
      title: 'Le Duel 2022',
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}