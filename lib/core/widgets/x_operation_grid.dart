import 'package:flutter/material.dart';
import 'package:get/get.dart';

class XOperationGrid extends StatelessWidget {
  final Icon? titleIcon;
  final String title;
  final Color backgroundColor;
  final Color? colorIconForStatus;
  final Color? titleColor;
  final Color? colorRounded;
  final bool withOutIcon;
  final bool isForTask;
  final String numberOperation;
  final Color? colorTitleTask;
  XOperationGrid._({
    Key? key,
    this.titleIcon,
    required this.title,
    required this.backgroundColor,
    this.colorRounded,
    this.colorIconForStatus,
    this.titleColor,
    this.colorTitleTask,
    this.isForTask = false,
    this.withOutIcon = false,
    required this.numberOperation,
  }) : super(key: key);

// Factory pour les cards des types de tâches
  factory XOperationGrid.basicGrid({
    // Permet d'afficher l'icon au centre de la card
    Icon? titleIcon,
    // Uniquement utilisé pour les cards qui n'utilise pas titleIcon(qui n'ont pas d'icon)
    bool withOutIcon = false,
    // Titre de la card
    required String title,
    required Color backgroundColor,
    required String numberOperation,
    Color? colorRounded,
    Color? titleColor,
    Color? colorTitleTask,
  }) {
    return XOperationGrid._(
        title: title,
        titleIcon: titleIcon,
        withOutIcon: withOutIcon,
        backgroundColor: backgroundColor,
        colorRounded: colorRounded,
        colorTitleTask: colorTitleTask,
        titleColor: titleColor,
        numberOperation: numberOperation);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 10, right: 10, bottom: 10),
              child: Container(
                width: context.width * 0.35,
                height: context.height * 0.20,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: Offset(0, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: withOutIcon
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Spacer(),
                            Text(
                              title.tr.capitalizeFirst
                                  .toString()
                                  .replaceAllMapped(r'\n', (match) => '\n'),
                              style: Get.textTheme.bodyText1!.copyWith(
                                  color: titleColor ?? Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.clip,
                            ),
                            Spacer(),
                            Text(
                              '$numberOperation ' +
                                  "Opérations".tr.capitalizeFirst.toString(),
                              style: Get.textTheme.bodyText2!.copyWith(
                                  color: colorTitleTask ??
                                      Get.theme.backgroundColor,
                                  decoration: TextDecoration.underline,
                                  fontSize: 13),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //Color pour le rounded de l'icon
                            Container(
                              height: 60,
                              width: 80,
                              decoration: BoxDecoration(
                                color: colorRounded,
                                border: Border.all(color: Colors.white),
                                shape: BoxShape.circle,
                              ),
                              child: titleIcon ?? Icon(Icons.abc),
                            ),
                            SizedBox(
                              height: context.height * 0.02,
                            ),
                            Text(
                              title.tr.capitalizeFirst.toString(),
                              style: Get.textTheme.bodyText1!.copyWith(
                                  color: titleColor ?? Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '$numberOperation ' +
                                  "Opérations".tr.capitalizeFirst.toString(),
                              style: Get.textTheme.bodyText2!.copyWith(
                                  color: Get.theme.backgroundColor,
                                  decoration: TextDecoration.underline,
                                  fontSize: 13),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
