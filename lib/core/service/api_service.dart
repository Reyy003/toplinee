part of 'services.dart';

// =========================
// Service to handle
// API Request
// =========================

class ApiRequestService {
  String? authorization;

  Dio _dio() {
    // Headers
    Map<String, dynamic> headers = {
      "Accept": "application/json",
    };

    // Get token from local storage
    authorization = LocalRepository.getPrefsCredentials;

    // Check if token not null
    if (authorization != null) {
      headers['Authorization'] = "Bearer $authorization";
    }

    return Dio(BaseOptions(headers: headers));
  }

  void get({
    required String url,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
    Map<String, dynamic>? queryParameters,
  }) {
    _dio().get(url, queryParameters: queryParameters).then((res) {
      // Call function on Success
      onSuccess(res);
    }).catchError((error) {
      // Call function on Error
      onError(error);
    });
  }

  void post({
    required String url,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  }) {
    _dio().post(
      url,
      queryParameters: queryParameters,
      data: (data != null) ? FormData.fromMap(data) : data,
    ).then((res) {
      // Call function on Success
      onSuccess(res);
    }).catchError((error) {
      // Call function on Error
      onError((error));
    });
  }
}
