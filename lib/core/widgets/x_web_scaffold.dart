import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'x_app_bar.dart';
import 'x_drawer.dart';

class XWebScaffold extends StatefulWidget {
  final Widget body;
  final int currentIndex;
  final Widget? floatingActionButton;

  XWebScaffold({
    Key? key,
    required this.body,
    this.currentIndex = 0,
    this.floatingActionButton,
  }) : super(key: key);

  @override
  State<XWebScaffold> createState() => _XWebScaffoldState();
}

class _XWebScaffoldState extends State<XWebScaffold> {
  late final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  void initState() {
    scaffoldKey = GlobalKey<ScaffoldState>(debugLabel: "eeeeee");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: FutureBuilder<int>(builder: (context, snaptshot) {
        if (snaptshot.hasData) {
          return Scaffold(
            key: scaffoldKey,
            endDrawerEnableOpenDragGesture: true,
            onEndDrawerChanged: (isOpen) {},
            backgroundColor: Get.theme.scaffoldBackgroundColor,
            drawer: XDrawer(
              key: const Key('tiny'),
              currentIndex: widget.currentIndex,
            ),
            appBar: kIsWeb
                ? XAppBar(
                    context: context,
                    userName: "Xefi",
                    //   "${user?.firstName ?? 'Jhon'} ${user?.lastName ?? 'Doe'}",

                    automaticallyImplyLeading: false,
                    scaffoldKey: scaffoldKey,
                    unreadNotifCount: snaptshot.data ?? 0,
                  )
                : null,
            body: Row(
              children: [
                Visibility(
                  child: XDrawer(
                    key: const Key('wide'),
                    currentIndex: widget.currentIndex,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 150,
                      vertical: 24,
                    ),
                    child: widget.body,
                  ),
                ),
              ],
            ),
            floatingActionButton: widget.floatingActionButton,
          );
        }
        return SizedBox();
      }),
    );
  }
}
