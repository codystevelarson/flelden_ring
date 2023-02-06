import 'dart:async';

import 'package:flelden_ring/themes/asset_paths.dart';
import 'package:flelden_ring/themes/colors.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatefulWidget {
  final String message;
  const LoadingIndicator({this.message = '', super.key});

  @override
  State<LoadingIndicator> createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator> {
  bool visible = false;
  late Timer _timer;
  Duration fadeDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
        const Duration(milliseconds: 500),
        (timer) => setState(() {
              visible = !visible;
            }));
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (widget.message.isNotEmpty)
          Text(
            widget.message,
            style: const TextStyle(color: kCGoldDark),
          ),
        SizedBox(
          height: 75,
          width: 75,
          child: AnimatedOpacity(
            opacity: visible ? 0.5 : 0.1,
            duration: fadeDuration,
            child: Image.asset(
              ImagePaths.eldenRingLogo,
              filterQuality: FilterQuality.low,
            ),
          ),
        ),
      ],
    );
  }
}
