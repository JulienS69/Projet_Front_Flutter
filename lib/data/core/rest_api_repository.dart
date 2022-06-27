import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'rest_api_toast.dart';

abstract class RestApiRepository {
  final dio.Dio client;
  @protected
  final String _controller;

  String get controller => _controller;

  RestApiRepository({
    required String controller,
    required this.client,
  }) : _controller = controller;

  Future<Either<dynamic, dynamic>> handlingGetResponse({
    required String queryRoute,
    Map<String, dynamic>? queryParameters,
    bool? showError = true,
    bool? showSuccess = true,
    bool? isCustomResponse = false,
    String? overrideSuccessMessage,
    String? overrideErrorMessage,
  }) async {
    try {
      dio.Response _response = await client.get(
        queryRoute,
        queryParameters: queryParameters,
      );
      return _verifError(
        response: _response,
        showError: showError!,
        showSuccess: showSuccess!,
        isCustomResponse: isCustomResponse!,
        overrideSuccessMessage: overrideSuccessMessage,
        overrideErrorMessage: overrideErrorMessage,
      );
    } on DioError catch (exception, stackTrace) {
      Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );

      if (exception.response != null) {
        return _verifError(
          response: exception.response!,
          showError: showError!,
          showSuccess: showSuccess!,
          isCustomResponse: isCustomResponse!,
          overrideSuccessMessage: overrideSuccessMessage,
          overrideErrorMessage: overrideErrorMessage,
        );
      } else {
        String _failure = 'restApiRequestException'.tr;
        if (showError!) {
          _flushToast(
            method: exception.requestOptions.method,
            isSuccess: false,
            isError: true,
            showSuccess: showSuccess!,
            showError: showError,
            customErrorMessage: _failure,
          );
        }
      }
      return left(stackTrace.toString());
    } catch (exception, stackTrace) {
      Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
      return left(stackTrace.toString());
    }
  }

  /// Vérifie si la réponse contient des erreurs, renvoie un Either en fonction
  Either<dynamic, dynamic> _verifError({
    required dio.Response response,
    required bool showError,
    required bool showSuccess,
    required bool isCustomResponse,
    String? overrideSuccessMessage,
    String? overrideErrorMessage,
  }) {
    bool _isSuccess = (response.statusCode ?? 520) >= 200 &&
        (response.statusCode ?? 520) <= 206;
    try {
      if (_isSuccess) {
        if (isCustomResponse) {
          _flushToast(
            method: response.requestOptions.method,
            isSuccess: _isSuccess,
            isError: false,
            showSuccess: showSuccess,
            showError: showError,
            customSuccessMessage:
                overrideSuccessMessage ?? response.data['message'],
          );
          return right(response.data);
        } else {
          _flushToast(
            method: response.requestOptions.method,
            isSuccess: _isSuccess,
            isError: false,
            showSuccess: showSuccess,
            showError: showError,
            customSuccessMessage: overrideSuccessMessage,
          );
          if (!response.data.containsKey("data")) {
            response.data["data"] = "{}";
          }
          if (response.data.containsKey('meta')) {
            List<dynamic> element = response.data['data'];
            for (var value in element) {
              value.addAll(
                {'meta': response.data['meta']},
              );
            }
          }
          return right(response.data["data"]);
        }
      } else {
        debugPrint("isCustomResponse: ${response.data}");
        if (isCustomResponse) {
          if (showError) {
            String customMessage = response.data['message'];
            _flushToast(
              method: response.requestOptions.method,
              isSuccess: _isSuccess,
              isError: true,
              showSuccess: showSuccess,
              showError: showError,
              customErrorMessage: overrideErrorMessage ?? customMessage,
            );
          }
          return left(response.data);
        }
        return left("[${response.statusCode}] ${response.data}");
      }
    } catch (exception, stackTrace) {
      Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
      String _failure = 'restApiRequestException'.tr;
      if (showError) {
        _flushToast(
          method: response.requestOptions.method,
          isSuccess: _isSuccess,
          isError: true,
          showSuccess: showSuccess,
          showError: showError,
          customErrorMessage: _failure,
        );
      }
      return left(_failure);
    }
  }
}

void _flushToast({
  required String method,
  required bool isSuccess,
  required bool isError,
  required bool showSuccess,
  required bool showError,
  String? customSuccessMessage,
  String? customErrorMessage,
}) {
  String _message = "";
  switch (method) {
    case "POST":
      _message = isSuccess
          ? customSuccessMessage ?? "storeSuccess".tr
          : customErrorMessage ?? "storeError".tr;
      break;
    case "PUT":
      _message = isSuccess
          ? customErrorMessage ?? "successUpdate".tr
          : customErrorMessage ?? "updateError".tr;
      break;
    case "DELETE":
      _message = isSuccess
          ? customErrorMessage ?? "successDelete".tr
          : customErrorMessage ?? "deleteError".tr;
      break;
    case "PATCH":
      _message = isSuccess
          ? customErrorMessage ?? "successUpdate".tr
          : customErrorMessage ?? "updateError".tr;
      break;
    case "EXCEPTION":
      _message = "unexpectedError".tr;
      break;
  }
  if (method != "GET") {
    if (Get.context != null) {
      if (isSuccess && showSuccess) {
        Toast.showSnackBar(
            context: Get.context!,
            snackBar: Toast.success(message: _message.tr));
      } else if (showError && isError) {
        Toast.showSnackBar(
            context: Get.context!, snackBar: Toast.error(message: _message.tr));
      }
    }
  }
}
