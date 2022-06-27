import 'package:Xefi/core/navigator/route.dart';
import 'package:get/get.dart';

import '../../view/operation/operation_view.dart';
import '../../view/operation/operation_view_controller_bindings.dart';

class Nav {
  static List<GetPage> routes = [
    GetPage(
      title: 'operation'.capitalizeFirst,
      name: Routes.operation,
      page: () => OperationView(),
      binding: OperationViewControllerBindings(),
    ),
  ];
}
