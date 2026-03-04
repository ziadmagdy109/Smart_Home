import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData, MultipartFile, Response;
import 'package:smart_home/core/utils/functions.dart';
import 'package:smart_home/core/utils/server_urls.dart';
import 'package:smart_home/model/api_response.dart';
import 'package:smart_home/view/auth/sign_in_view.dart';
import 'token_manager.dart';

class APICrudServices extends GetxController {
  final TokenManager tokenManager = Get.find<TokenManager>();

  late Dio dio;

  @override
  void onInit() {
    dio = Dio(
      BaseOptions(
        baseUrl: ServerUrls.baseUrl,
        connectTimeout: const Duration(minutes: 2),
        receiveTimeout: const Duration(minutes: 2),
        headers: {
          "Accept": "application/json",
        },
        validateStatus: (status) => true,
      ),
    );
    super.onInit();
  }

  bool _isSuccess(int? statusCode) {
    print(statusCode);
    return statusCode != null && statusCode >= 200 && statusCode < 300;
  }

  Future<APIResponse> get({
    required String endPoint,
    Map<String, dynamic>? queryParams,
    bool sendToken = true,
  }) async {
    final token = await tokenManager.getToken();

    final response = await dio.get(
      ServerUrls.baseUrl + endPoint,
      queryParameters: queryParams,
      options: Options(
        headers: sendToken ? {"Authorization": "Bearer $token"} : {},
      ),
    );

    log(response.data.toString());

    if (sendToken) {
      checkTokenValidity(response);
    }

    return APIResponse(
      status: _isSuccess(response.statusCode),
      data: response.data,
    );
  }

  Future<APIResponse> post({
    required String endPoint,
    required Map<String, dynamic> body,
    Map<String, dynamic>? queryParams,
    bool sendToken = true,
  }) async {
    final token = await tokenManager.getToken();

    final response = await dio.post(
      ServerUrls.baseUrl + endPoint,
      data: FormData.fromMap(body),
      queryParameters: queryParams,
      options: Options(
        headers: {
          if (sendToken) "Authorization": "Bearer $token",
        },
      ),
    );

    print(endPoint);
    print(body);
    print(response.realUri.toString());
    print(response.data);

    if (sendToken) {
      checkTokenValidity(response);
    }

    return APIResponse(
      status: _isSuccess(response.statusCode),
      data: response.data,
    );
  }

  Future<APIResponse> put({
    required String endPoint,
    required Map<String, dynamic> body,
    Map<String, dynamic>? queryParams,
  }) async {
    final token = await tokenManager.getToken();

    final response = await dio.put(
      ServerUrls.baseUrl + endPoint,
      data: FormData.fromMap(body),
      queryParameters: queryParams,
      options: Options(
        headers: {"Authorization": "Bearer $token"},
      ),
    );

    checkTokenValidity(response);

    return APIResponse(
      status: _isSuccess(response.statusCode),
      data: response.data,
    );
  }

  Future<APIResponse> patch({
    required String endPoint,
    required Map<String, dynamic> body,
    Map<String, dynamic>? queryParams,
  }) async {
    final token = await tokenManager.getToken();

    final response = await dio.patch(
      ServerUrls.baseUrl + endPoint,
      data: FormData.fromMap(body),
      queryParameters: queryParams,
      options: Options(
        headers: {"Authorization": "Bearer $token"},
      ),
    );

    checkTokenValidity(response);

    return APIResponse(
      status: _isSuccess(response.statusCode),
      data: response.data,
    );
  }

  Future<APIResponse> delete({
    required String endPoint,
    Map<String, dynamic>? queryParams,
  }) async {
    final token = await tokenManager.getToken();

    final response = await dio.delete(
      ServerUrls.baseUrl + endPoint,
      queryParameters: queryParams,
      options: Options(
        headers: {"Authorization": "Bearer $token"},
      ),
    );

    checkTokenValidity(response);

    return APIResponse(
      status: _isSuccess(response.statusCode),
      data: response.data,
    );
  }

  Future<APIResponse> uploadFile(String filePath) async {
    final token = await tokenManager.getToken();

    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(filePath),
    });

    final response = await dio.post(
      "${ServerUrls.baseUrl}/v1/media/other",
      data: formData,
      options: Options(
        headers: {"Authorization": "Bearer $token"},
      ),
    );

    return APIResponse(
      status: _isSuccess(response.statusCode),
      data: response.data?['data'],
    );
  }

  Future<APIResponse> uploadVoice(String filePath) async {
    final token = await tokenManager.getToken();

    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(filePath),
    });

    final response = await dio.post(
      "${ServerUrls.baseUrl}/v1/media/voice",
      data: formData,
      options: Options(
        headers: {"Authorization": "Bearer $token"},
      ),
    );

    return APIResponse(
      status: _isSuccess(response.statusCode),
      data: response.data?['data'],
    );
  }

  void checkTokenValidity(Response response) {
    if (response.statusCode == 401 ||
        (response.data is Map &&
            response.data['message'] == 'Access Denied')) {

      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.offAll(() => SignInView());
      });

      showSnackBar(
        message: 'انتهت مدة الجلسة ، سجل الدخول',
        isError: true,
      );

      tokenManager.logout();
    }
  }
}