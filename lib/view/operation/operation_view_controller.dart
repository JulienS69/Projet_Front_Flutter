import 'package:Xefi/data/model/operation/operation.dart';
import 'package:Xefi/repositories/operation_repository.dart';
import 'package:get/get.dart';

class OperationViewController extends GetxController
    with StateMixin, GetTickerProviderStateMixin {
  final OperationRepository operationRepository;
  RxList<String> operations = <String>[""].obs;
  RxList<Operation> operationsList = <Operation>[].obs;

  OperationViewController({
    required this.operationRepository,
  });

  @override
  void onReady() async {
    operationsList.value = await operationRepository.getAllOperations().then(
          (either) => either.fold((l) => <Operation>[], (r) => r),
        );
    change(null, status: RxStatus.success());

    super.onReady();
  }
}
