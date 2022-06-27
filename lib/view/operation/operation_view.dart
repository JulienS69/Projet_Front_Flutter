import 'package:Xefi/core/widgets/loader_xefi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'operation_view_controller.dart';

class OperationView extends GetResponsiveView<OperationViewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Text("test"),
        ],
      ),
      body: controller.obx(
        (state) => listing(context),
        onLoading: LoaderDailyApps(),
      ),
    );
  }

  Widget listing(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 500,
          child: ListView.builder(
            itemCount: controller.operationsList.length,
            itemBuilder: (context, index) => InkWell(
              child: ListTile(
                leading: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(
                    Icons.check,
                    color: Colors.black,
                    size: 22,
                  ),
                ),
                title: Text(
                  controller.operationsList[index].montantOperation.toString(),
                  style: Get.textTheme.bodyText1,
                ),
                onTap: () {},
              ),
            ),
          ),
        ),
      ],
    );
  }
}
