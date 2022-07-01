import 'package:Xefi/core/widgets/loader_xefi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../helper/constants.dart';
import '../theme/color_theme.dart';

class FbErrorWidget extends StatelessWidget {
  final String message;
  const FbErrorWidget(this.message, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        message,
        style: Get.theme.inputDecorationTheme.hintStyle!.copyWith(
          color: Get.theme.unselectedWidgetColor,
        ),
      ),
    );
  }
}

class FbLoadingWidget extends StatelessWidget {
  final Color? backgroundColor;
  const FbLoadingWidget({
    Key? key,
    this.backgroundColor = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 25,
        width: 25,
        child: LoaderDailyApps(),
      ),
    );
  }
}

class FbEmptyWidget extends StatelessWidget {
  final String? title;
  final String message;
  final String? asset;
  const FbEmptyWidget({
    Key? key,
    required this.message,
    this.title,
    this.asset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: SvgPicture.asset(
                  asset ?? svgEmptySearchResult,
                ),
              ),
              RichText(
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: (title ?? "oops".tr) + "\r\n\r\n",
                      style: Get.textTheme.bodyText1!.copyWith(
                          color: Get.theme.errorColor,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: message,
                      //style du deuxieme élément
                      style: Get.textTheme.bodyText2!.copyWith(color: grey5),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
