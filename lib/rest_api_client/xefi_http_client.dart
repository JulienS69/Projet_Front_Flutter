import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../core/helper/constants.dart';

class XefiHttpClient extends GetxService {
  Future<Dio> init() async {
    final _client = Dio();
    _client.options.baseUrl = urlBase;
    _client.options.receiveTimeout = 90000;
    _client.options.sendTimeout = 90000;
    _client.options.connectTimeout = 10000;
    _client.options.headers["Accept"] = "application/json";
    _client.options.contentType = 'application/json; charset=utf-8';
    return _client;
  }
}
