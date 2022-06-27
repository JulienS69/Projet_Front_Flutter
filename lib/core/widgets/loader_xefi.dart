import 'dart:math' as math;

import 'package:flutter/material.dart';

class LoaderDailyApps extends StatefulWidget {
  final Color? backgroundColor;
  LoaderDailyApps({this.backgroundColor});

  @override
  _LoaderDailyAppsState createState() => _LoaderDailyAppsState();
}

class _LoaderDailyAppsState extends State<LoaderDailyApps>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1750));
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            width: 100,
            height: 100,
            color: widget.backgroundColor,
            child: CircularProgressIndicator(
              backgroundColor: widget.backgroundColor,
              strokeWidth: 2.5,
              color: Color(0xFFE20917),
            ),
          ),
        ),
        Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (_, child) {
              return Transform.rotate(
                angle: _controller.value * 2 * math.pi,
                child: child,
              );
            },
            child: Image.asset(
              'assets/logo/dailyapps_icon.png',
              height: 75,
              width: 75,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
