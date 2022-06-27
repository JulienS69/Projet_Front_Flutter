import 'package:Xefi/repositories/operation_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'operation_view_controller.dart';

class OperationViewControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => OperationViewController(
        operationRepository: OperationRepository(),
      ),
    );
    Get.lazyPut(
      () => Dio(),
    );
  }
}
