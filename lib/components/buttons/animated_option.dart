import 'dart:async';

import 'package:flelden_ring/themes/colors.dart';
import 'package:flutter/material.dart';

class AnimatedOption extends StatefulWidget {
  final String text;
  const AnimatedOption(this.text, {super.key});

  @override
  State<AnimatedOption> createState() => _AnimatedOptionState();
}

class _AnimatedOptionState extends State<AnimatedOption> {
  bool visible = false;
  final Duration _fadeDuration = const Duration(seconds: 1);
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
      _fadeDuration,
      (timer) => setState(() {
        visible = !visible;
      }),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 300,
      child: Stack(
        children: [
          AnimatedOpacity(
            opacity: visible ? .6 : .2,
            duration: _fadeDuration,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(color: kCLight, width: 2),
                color: kCGoldDark,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 50.0, vertical: 8.0),
              child: Text(
                widget.text,
                style: Theme.of(context).textTheme.titleSmall,
                maxLines: 1,
              ),
            ),
          )
        ],
      ),
    );
  }
}
