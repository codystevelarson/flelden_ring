import 'dart:async';

import 'package:flelden_ring/themes/colors.dart';
import 'package:flutter/material.dart';

class AnimatedOption extends StatefulWidget {
  final String text;
  final bool active;
  const AnimatedOption(this.text, this.active, {super.key});

  @override
  State<AnimatedOption> createState() => _AnimatedOptionState();
}

class _AnimatedOptionState extends State<AnimatedOption> {
  bool visible = true;
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
            opacity: widget.active && visible ? .6 : .2,
            duration: _fadeDuration,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: widget.active
                  ? BoxDecoration(
                      border: Border.all(color: kCLight, width: 2),
                      borderRadius:
                          const BorderRadius.all(Radius.elliptical(100, 100)),
                      color: kCGoldDark,
                    )
                  : null,
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
