import 'package:flutter/material.dart';
import 'package:get/get.dart';

class XCard extends StatelessWidget {
  XCard({
    Key? key,
    required this.titleIcon,
    required this.title,
    required this.textBody,
    required this.backgroundColor,
    required this.warningColor,
    required this.cardButtonList,
    this.isImportant = false,
  }) : super(key: key);

  final Icon titleIcon;
  final String title, textBody;
  final Color backgroundColor, warningColor;
  final bool isImportant;
  final List<XCardButton> cardButtonList;

  factory XCard.basic({
    required Icon titleIcon,
    required Icon textBodyIcon,
    required String title,
    String? textBody,
    bool isImportant = false,
  }) {
    return XCard(
      title: title,
      titleIcon: titleIcon,
      textBody: textBody ?? '',
      backgroundColor: Get.theme.primaryColorDark,
      warningColor: Get.theme.errorColor,
      cardButtonList: [],
      isImportant: isImportant,
    );
  }

  factory XCard.withAction({
    required Icon titleIcon,
    required Icon textBodyIcon,
    required String title,
    required String textBody,
    required List<XCardButton> cardButtonList,
    bool isImportant = false,
  }) {
    return XCard(
      title: title,
      titleIcon: titleIcon,
      textBody: textBody,
      backgroundColor: Get.theme.primaryColorDark,
      warningColor: Get.theme.errorColor,
      isImportant: isImportant,
      cardButtonList: cardButtonList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (cardButtonList.isEmpty) ...[
                  Row(
                    children: [
                      titleIcon,
                      const SizedBox(width: 8),
                      Container(
                        width: 280,
                        child: Text(
                          title,
                          style: Get.textTheme.bodyText1!
                              .copyWith(color: Colors.white),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                ],
                Row(
                  children: [
                    if (cardButtonList.isEmpty && isImportant) ...[
                      Icon(
                        Icons.priority_high,
                        color: Get.theme.errorColor,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                    ],
                    SizedBox(
                      width: 300,
                      child: Text(
                        textBody,
                        style: Get.textTheme.bodyText2!.copyWith(
                          color: Get.theme.primaryColorLight,
                          decoration: cardButtonList.isNotEmpty
                              ? TextDecoration.none
                              : TextDecoration.underline,
                          fontSize: 12,
                          overflow: TextOverflow.clip,
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                if (cardButtonList.isNotEmpty) ...[
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: List.generate(
                      cardButtonList.length,
                      (index) => Row(
                        children: [
                          XCardButton(
                            label: cardButtonList[index].label,
                            labelColor: cardButtonList[index].labelColor,
                            onTap: cardButtonList[index].onTap,
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
        if (cardButtonList.isEmpty) ...[
          //Permet que le trait rouge prenne toute la hauteur,
          //il est poussé de 403dp sinon il prend toute la largeur
          Positioned.fill(
            right: 403,
            child: Container(
              decoration: BoxDecoration(
                color: Get.theme.errorColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  topLeft: Radius.circular(8),
                ),
              ),
            ),
          ),
        ]
      ],
    );
  }
}

class XCardButton extends StatelessWidget {
  final String label;
  final Color labelColor;
  final void Function()? onTap;

  XCardButton({
    required this.label,
    required this.labelColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    {
      return InkWell(
        onTap: () {
          if (onTap != null) {
            onTap!();
          }
        },
        child: Text(label,
            style: Get.textTheme.bodyText2!.copyWith(
              decoration: TextDecoration.underline,
              color: labelColor,
              fontSize: 13,
            ),
            maxLines: 3),
      );
    }
  }
}
