import 'dart:async';

import 'package:flelden_ring/screens/main_menu_screen.dart';
import 'package:flelden_ring/utilities/asset_paths.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  static const String path = '/';
  static const String name = 'splash';
  final String endRoute;
  const SplashScreen({this.endRoute = MainMenu.path, super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final Duration fadeDuration = const Duration(milliseconds: 500);
  final Duration displayDuration = const Duration(seconds: 5);
  Timer timer = Timer(Duration.zero, () {});
  bool isVisible = false;
  int currentIndex = 0;
  String imagePath = '';
  List<String> imagePaths = [
    ImagePaths.bandiLogo,
    ImagePaths.fromSoftLogo,
  ];

  @override
  void initState() {
    super.initState();
    start();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => nextOrGo(),
        child: Container(
          color: Colors.black,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: imagePath.isNotEmpty
              ? AnimatedOpacity(
                  duration: fadeDuration,
                  opacity: isVisible ? 1.0 : 0.0,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                  ),
                )
              : const SizedBox.expand(),
        ),
      ),
    );
  }

  void start() {
    /// Start slides show
    nextOrGo();
  }

  void setNextTimer() {
    timer = Timer(displayDuration, nextOrGo);
    setState(() {});
  }

  void nextOrGo() async {
    if (await next()) return;

    /// If none found, navigate to main menu
    context.go(widget.endRoute);
  }

  Future<bool> next() async {
    timer.cancel();

    /// Start fade out
    if (isVisible) {
      setState(() {
        isVisible = false;
      });
      await Future.delayed(fadeDuration, () {});
    }

    /// Advance production image
    if (currentIndex < imagePaths.length) {
      imagePath = imagePaths[currentIndex];
      currentIndex++;
      Timer(fadeDuration, () {
        setState(() {
          isVisible = true;
        });
      });
      setState(() {});
      setNextTimer();
      return true;
    }
    return false;
  }
}
