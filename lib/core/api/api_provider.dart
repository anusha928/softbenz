import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:softbenz_task/core/app/end_point_const.dart';
import 'package:softbenz_task/core/error_handling/exception.dart';
import 'package:softbenz_task/core/utils/text_utils.dart';

class ApiProvider {
  final Dio dio;

  ApiProvider()
      : dio = Dio(BaseOptions(
            contentType: "application/json", baseUrl: EndPointConst.baseUrl));

  Future<dynamic> get(String url,
      {bool isRefreshRequest = false,
      Map<String, dynamic>? queryParams}) async {
    dynamic responseJson;

    try {
      final Map<String, String> header = {
        'content-type': 'application/json',
        'accept': 'application/json',
        'origin': '*',
      };

      queryParams = {
        ...?queryParams,
      };

      final dynamic response = await dio.get(
        url,
        options: Options(
          headers: header,
        ),
        queryParameters: queryParams,
      );

      responseJson = _response(response, url, cacheResult: true);
    } on DioException catch (e, s) {
      responseJson = await _handleErrorResponse(e);
      Logger().e(e);
      Logger().d(s);
    }
    return responseJson;
  }

  _handleErrorResponse(DioException e) async {
    if (e.toString().toLowerCase().contains("socketexception")) {
      throw const ConnectionFailure(message: 'No Internet connection');
    } else {
      if (e.response != null) {
        return await _response(e.response!, "");
      } else {
        throw const ServerFailure(
            message: 'An error occurred while fetching data.');
      }
    }
  }

  Future<Map<String, dynamic>> _response(Response response, String url,
      {bool cacheResult = false}) async {
    final responseJson = <String, dynamic>{};
    responseJson['data'] = response.data;

    responseJson['statusCode'] = response.statusCode;
    switch (response.statusCode) {
      case 200:
      case 201:
      case 204:
        return responseJson;
      case 400:
        throw ServerFailure(
          message: getErrorMessage(response.data),
          statusCode: response.statusCode,
        );
      case 401:
      case 402:
        throw ServerFailure(
          message: getErrorMessage(response.data),
          statusCode: response.statusCode,
        );
      case 403:
        throw ServerFailure(
          message: getErrorMessage(response.data),
          statusCode: response.statusCode,
        );
      case 404:
        throw ServerFailure(
          message: getErrorMessage(response.data),
          statusCode: response.statusCode,
        );
      case 409:
        throw ServerFailure(
          message: getErrorMessage(response.data),
          statusCode: response.statusCode,
        );
      case 422:
        responseJson['error'] = getErrorMessage(response.data);
        throw ServerFailure(
          message: getErrorMessage(response.data),
          statusCode: response.statusCode,
        );
      case 500:
        throw ServerFailure(
          message: getErrorMessage(response.data),
          statusCode: response.statusCode,
        );
      default:
        throw ServerFailure(
          message: 'Error occured while Communication with Server',
          statusCode: response.statusCode,
        );
    }
  }

  String getErrorMessage(dynamic res) {
    try {
      debugPrint("-------------------GET ERROR ------------------");
      if (res case {"info": {"object": {"message": {"Message": String msg}}}}) {
        return msg;
      } else if (res case {"message": String msg}) {
        return msg.capitalize();
      } else if (res case {"error": String msg}) {
        return msg;
      } else if (res case {"error": [String msg]}) {
        return msg;
      } else if (res case {"error": {"message": String msg}}) {
        return msg;
      } else if (res case {"detail": String msg}) {
        return msg;
      } else {
        return "Internal Server Error";
      }
    } catch (e) {
      return e.toString();
    } finally {
      if (kDebugMode) {
        print('-------- MESSAGE');
        print(res);
      }
    }
  }
}
