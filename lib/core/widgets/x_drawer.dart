import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../navigator/route.dart';
import '../theme/color_theme.dart';

class XDrawer extends StatelessWidget {
  final int currentIndex;

  /// Barre de navigation web
  ///
  /// ```
  /// XDrawer(
  ///   currentIndex: currentIndex,
  /// ),
  /// ```
  XDrawer({
    Key? key,
    this.currentIndex = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      height: double.infinity,
      color: Get.theme.colorScheme.secondaryContainer,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      // NOTE - Permet de ne pas afficher le fond au clic
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      onTap: () async {},
                    ),
                    const SizedBox(height: 40),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SECTION - MANAGE
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                          ),
                          child: Text(
                            'manage'.tr.toUpperCase(),
                            style:
                                Get.textTheme.bodyText1?.copyWith(color: white),
                          ),
                        ),
                        const SizedBox(height: 8),

                        const SizedBox(height: 32),
                        // SECTION - SETUP
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                          ),
                          child: Text(
                            'setUp'.tr.toUpperCase(),
                            style:
                                Get.textTheme.bodyText1?.copyWith(color: white),
                          ),
                        ),
                        const SizedBox(height: 8),

                        const SizedBox(height: 32),
                      ],
                    ),

                    // SECTION - APPLICATION
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: Text(
                        'application'.tr.toUpperCase(),
                        style: Get.textTheme.bodyText1?.copyWith(color: white),
                      ),
                    ),
                    const SizedBox(height: 8),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void toPage(int value) {
    switch (value) {
      case 0:
        Get.offAllNamed(Routes.operation);
        break;

      default:
        Get.offAllNamed(Routes.operation);
        break;
    }
  }
}
