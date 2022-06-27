import 'dart:async';

import 'package:Xefi/rest_api_client/xefi_http_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'core/navigator/navigation.dart';
import 'core/navigator/route.dart';
import 'core/theme/theme.dart';

FutureOr<SentryEvent?> beforeSend(SentryEvent event, {dynamic hint}) async {
  bool clear = event.exceptions
          ?.any((element) => element.value?.contains("RenderFlex") ?? false) ??
      false;

  return clear ? null : event;
}

void main() async {
  await initHttpClients();

  String _dsn = kDebugMode
      ? ''
      : 'https://f53bbcb615034f89af9bb5ca7189c7a9@sentry.lebureauvirtuel.fr/6';

  await SentryFlutter.init(
    (options) {
      options.dsn = _dsn;
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
      options.beforeSend = beforeSend;
    },
    appRunner: () => runApp(
      MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      title: 'XEFI',
      theme: myTheme,
      darkTheme: myTheme,
      themeMode: ThemeMode.light,
      locale: Get.deviceLocale,
      defaultTransition: Transition.noTransition,
      initialRoute: Routes.initialRoute,
      getPages: Nav.routes,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        //SfGlobalLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('fr', 'FR'),
        const Locale('en', 'EN'),
        const Locale('de', 'DE'),
      ],
    );
  }
}

///Injection persistante des services http
Future<void> initHttpClients() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  await Get.putAsync<Dio>(() => XefiHttpClient().init(), tag: 'xefi');
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
