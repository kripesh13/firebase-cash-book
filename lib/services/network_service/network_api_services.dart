import 'dart:io';
import '../../res/barrel_file.dart';

class NetworkApiServices extends BaseApiServices {
  late String baseUrl;
  late String token;
  late Dio dio;

  NetworkApiServices({required this.baseUrl}) {
    dio = Dio(BaseOptions(baseUrl: baseUrl));
    token = LocalStorageService.read(LocalStorageKeys.accessToken) ?? '';
  }

  @override
  Future<dynamic> getApiResponseServices(String url) async {
    logger.i('Full URL: $baseUrl$url');
    try {
      final response = await dio.get(
        '$baseUrl$url',
        options: Options(
          headers: _getHeaders(token),
        ),
      );
      return _returnResponse(response);
    } on SocketException {
      _handleSocketException();
      throw FetchDataException('No Internet Connrected');
    } 
    on DioException catch (e) {
      _handleDioException(e);
   }
  }

  @override
  Future<dynamic> postApiResponseServices(String url, dynamic data) async {
    logger.i('Full URL: $baseUrl$url');
    logger.i('Token: $token');
    logger.i('Data: $data');
    try {
      final response = await dio.post(
        '$baseUrl$url',
        data: data,
        options: Options(
          headers: _getHeaders(token),
        ),
      );
      return _returnResponse(response);
    } on SocketException {
      _handleSocketException();
    } on DioException catch (e) {
      _handleDioException(e);
    }
  }

  @override
  Future<dynamic> deleteApiResponseServices(String url, dynamic data) async {
    try {
      final response = await dio.delete(
        '$baseUrl$url',
        data: data,
        options: Options(
          headers: _getHeaders(token),
        ),
      );
      return _returnResponse(response);
    } on SocketException {
      _handleSocketException();
    } on DioException catch (e) {
      _handleDioException(e);
    }
  }

  @override
  Future<dynamic> patchApiResponseServices(String url, dynamic data) async {
    try {
      final response = await dio.patch(
        '$baseUrl$url',
        data: data,
        options: Options(
          headers: _getHeaders(token),
        ),
      );
      return _returnResponse(response);
    } on SocketException {
        _handleSocketException();
    } 
    // on DioException catch (e) {
    //   _handleDioException(e);
    // }
  }

  Map<String, String> _getHeaders(String headerToken) {
    return {
      'Authorization': 'Bearer $headerToken',
      "Content-Type": "application/json",
    };
  }

  dynamic _returnResponse(Response response) {
    logger.i("Response Data: ${response.data}");
    switch (response.statusCode) {
      case 200:
        return response.data;
      case 400:
        throw BadRequestException('Invalid URL');
      case 401:
        throw BadRequestException('Invalid Account Details');
      case 404:
        throw UnAuthorizedException('Invalid URL');
      default:
        throw Exception('Error communicating with server');
    }
  }

  void _handleDioException(DioException e) {
    logger.e('Dio Error: ${e.message}');
    logger.e('Response Status Code: ${e.response?.statusCode}');
    logger.e('Response Data: ${e.response?.data}');

    if (e.response?.data != null && e.response?.data['message'] != null) {
      logger.i('Error Message: ${e.response!.data['message']}');
      ToastService().e(e.response!.data['message']);
    } else {
      navigatorKey.currentState!.pushNamed(RoutesName.noInternet);
      ToastService()
          .e(
            'No internet connection',
          )
          .timer;
      _handleSocketException();
    }
    throw AppException('Error', 'Unhandled exception');
  }

  void _handleSocketException() {
    throw FetchDataException('No internet connection');
  }
}
