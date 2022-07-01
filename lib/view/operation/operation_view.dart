import 'package:Xefi/core/widgets/loader_xefi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/helper/constants.dart';
import '../../core/helper/string_utils.dart';
import '../../core/widgets/error_widget.dart';
import '../../core/widgets/x_operation_grid.dart';
import '../../data/core/rest_api_toast.dart';
import 'operation_view_controller.dart';

class OperationView extends GetResponsiveView<OperationViewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Affichages des Transactions"),
      ),
      body: controller.obx(
        (state) => listingOperation(context),
        onLoading: LoaderDailyApps(),
      ),
    );
  }

  Widget listingOperation(BuildContext context) {
    return controller.operationsList.isEmpty
        ? FbEmptyWidget(
            title: 'Aucunes transactions trouvées'.tr,
            message: 'Veuillez vérifier la connexion à votre API',
            asset: svgEmptySearchResult,
          )
        : Padding(
            padding: const EdgeInsets.only(top: 25.0, left: 15, right: 15),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  color: Get.theme.scaffoldBackgroundColor,
                  child: InkWell(
                    highlightColor: Get.theme.scaffoldBackgroundColor,
                    onTap: () {
                      Toast.showSnackBar(
                          context: Get.context!,
                          snackBar: Toast.success(
                              duration: const Duration(seconds: 1),
                              message:
                                  "Vous avez cliqué sur le type d'opération ${controller.operationsList[index].typeOperation}"));
                    },
                    child: XOperationGrid.basicGrid(
                      title: controller.operationsList[index].typeOperation
                          .toString(),
                      titleIcon: getTypeOperationIcon(controller
                          .operationsList[index].typeOperation
                          .toString()),
                      titleColor: Get.theme.primaryColorDark,
                      backgroundColor: Colors.white,
                      colorRounded: getTypeOperationColor(controller
                              .operationsList[index].typeOperation
                              .toString())
                          .withOpacity(0.25),
                      numberOperation:
                          controller.operationsList.length.toString(),
                    ),
                  ),
                );
              },
              itemCount: controller.operationsList.length,
            ),
          );
  }
}
