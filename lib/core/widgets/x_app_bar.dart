import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../theme/color_theme.dart';

class XAppBar extends AppBar {
  /// Barre supérieur de l"application
  XAppBar({
    Key? key,
    String? userName,
    required BuildContext context,
    bool automaticallyImplyLeading = true,
    required GlobalKey<ScaffoldState> scaffoldKey,
    required int unreadNotifCount,
  }) : super(
          key: key,
          automaticallyImplyLeading: automaticallyImplyLeading,
          backgroundColor: Get.theme.bottomAppBarColor,
          iconTheme: Get.theme.iconTheme,
          // Logo XEFI APPS, redirection sur AuthProvider
          title: Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                child: InkWell(
                  // NOTE - Permet de ne pas afficher le fond au clic
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onTap: () async {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Icon(
                  Icons.circle,
                  size: 6,
                ),
              ),
              Text(
                "vendeur".tr,
                style: Get.textTheme.headline5,
              ),
            ],
          ),
          // Liste d'action sur le nom de l'utilisateur
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Center(
                child: Stack(
                  children: [
                    IconButton(
                      onPressed: () {
                        scaffoldKey.currentState!.openEndDrawer();
                      },
                      icon: Icon(Icons.sms),
                    ),
                    if (1 > 0)
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                          alignment: Alignment.center,
                          child: Text(
                            '$unreadNotifCount',
                            style:
                                Get.textTheme.caption!.copyWith(color: white),
                          ),
                        ),
                      )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    LineAwesomeIcons.question_circle,
                    color: Get.theme.primaryColor.withOpacity(0.8),
                    size: 28,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
              child: PopupMenuButton(
                tooltip: 'showMenu'.tr,
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        userName ?? '',
                        style: Get.textTheme.bodyText1,
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.arrow_drop_down,
                      ),
                    ],
                  ),
                ),
                onSelected: (value) async {
                  switch (value) {
                    case 'monCompte':
                      break;
                    case 'legalAdvice':
                      break;
                    case 'confidentialityPolicy':
                      break;
                    case 'cgu':
                      break;
                    default:
                  }
                },
                itemBuilder: (context) => [
                  // TODO - Ajouter les autres options du menu
                  PopupMenuItem(
                    value: 'monCompte',
                    child: Text(
                      'monCompte'.tr,
                    ),
                  ),
                  PopupMenuItem(
                    value: 'legalAdvice',
                    child: Text(
                      'legalAdvice'.tr,
                    ),
                  ),
                  PopupMenuItem(
                    value: 'confidentialityPolicy',
                    child: Text(
                      'privacyPolicy'.tr,
                    ),
                  ),
                  PopupMenuItem(
                    value: 'cgu',
                    child: Text(
                      'cgu'.tr,
                    ),
                  ),
                  PopupMenuItem(
                    value: 'logout',
                    child: Text(
                      'logout'.tr,
                    ),
                  ),
                ],
              ),
            )
          ],
        );
}
