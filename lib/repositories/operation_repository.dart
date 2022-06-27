import 'package:Xefi/data/core/rest_api_repository.dart';
import 'package:Xefi/data/model/operation/operation.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class OperationRepository extends RestApiRepository {
  OperationRepository()
      : super(
          controller: '/operations',
          client: Get.find<Dio>(tag: 'xefi'),
        );

  Future<Either<String, List<Operation>>> getAllOperations(
      {Map<String, dynamic>? body,
      bool showError = false,
      bool showSuccess = false}) async {
    return await handlingGetResponse(
            queryRoute: controller,
            showError: showError,
            showSuccess: showSuccess)
        .then(
      (value) => value.fold(
        (l) {
          return left(l);
        },
        (r) {
          try {
            return right(
              r
                  .map<Operation>(
                    (e) => Operation.fromJson(e),
                  )
                  .toList(),
            );
          } catch (exception, stackTrace) {
            Sentry.captureException(
              exception,
              stackTrace: stackTrace,
            );
            return right([]);
          }
        },
      ),
    );
  }
}
