import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flelden_ring/components/buttons/animated_option.dart';
import 'package:flelden_ring/components/loading/loading_indicator.dart';
import 'package:flelden_ring/themes/asset_paths.dart';
import 'package:flelden_ring/themes/text_styles.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatefulWidget {
  static const String path = '/main_menu';
  static const String name = 'main_menu';
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  bool fadingIn = false;
  bool started = false;
  bool loading = true;
  String networkMessage = 'in progress work';

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      setState(() {
        fadingIn = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: AnimatedOpacity(
          opacity: fadingIn ? 1 : 0,
          duration: const Duration(seconds: 1),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            // onTap: tap,
            child: Listener(
              onPointerDown: (event) => tap(),
              child: Container(
                color: Colors.black,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    /// Background Image
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height * .1,
                          ),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * .9,
                            child: Image.asset(ImagePaths.eldenRingLogo),
                          ),
                        ),
                      ),
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        /// Title Text
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * .2),
                            width: MediaQuery.of(context).size.width * .8,
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * .2,
                                ),
                                child: AutoSizeText(
                                  'ELDEN RING',
                                  style:
                                      Theme.of(context).textTheme.displayLarge,
                                  maxLines: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 50,
                              ),
                              !started
                                  ? AnimatedOption('press any key')
                                  : TitleMenu(),
                            ],
                          ),
                        )
                      ],
                    ),

                    /// Messages & loading Icon
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(networkMessage),
                        ),
                        if (loading)
                          const LoadingIndicator(
                            message: 'connecting to network',
                          )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void tap() {
    setState(() {
      started = !started;
    });
  }
}

class TitleMenu extends StatefulWidget {
  const TitleMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<TitleMenu> createState() => _TitleMenuState();
}

class _TitleMenuState extends State<TitleMenu> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: ((context, index) => Center(child: Text('Menu options'))));
  }
}
