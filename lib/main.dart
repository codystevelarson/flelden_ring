import 'package:flelden_ring/navigation/router.dart';
import 'package:flelden_ring/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const FleldenRingApp());
}

class FleldenRingApp extends StatelessWidget {
  const FleldenRingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: eldenRouter,
      title: 'Flelden Ring',
      theme: appTheme,
    );
  }
}
