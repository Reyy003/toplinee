part of 'providers.dart';

class AuthProvider {
  late ApiRequestService _service;

  AuthProvider() {
    // Inject API Request service
    _service = Get.find<ApiRequestService>();
  }

  void loginUser({
    required LoginRequest data,
    required Function(AuthResponse response) onSuccess,
    required Function(ErrorResponse error) onError,
    Function()? beforeSend,
  }) {
    if (beforeSend != null) {
      beforeSend();
    }

    _service.post(
      url: baseUrl + login,
      data: data.toJson(),
      onSuccess: (response) {
        if (response is dio.Response) {
          if (response.statusCode == 200) {
            // Return data
            onSuccess(AuthResponse.fromJson(response.data));
          }
        } else {
          // Return error response from json
          onError(ErrorResponse.fromJson(response.data));
        }
      },
      onError: (error) {
        if (error is dio.DioError) {
          if (error.response != null) {
            // Return error response from json
            onError(ErrorResponse.fromJson(error.response!.data));
          }
        } else {
          // Return error response manual
          onError(
            ErrorResponse(
              message: error.type.toString(),
              success: false,
            ),
          );
        }
      },
    );
  }

  void registerUser({
    required RegisterRequest data,
    required Function(AuthResponse response) onSuccess,
    required Function(ErrorResponse error) onError,
    Function()? beforeSend,
  }) {
    if (beforeSend != null) {
      beforeSend();
    }

    _service.post(
      url: baseUrl + register,
      data: data.toJson(),
      onSuccess: (response) {
        if (response is dio.Response) {
          if (response.statusCode == 200) {
            // Return data
            onSuccess(AuthResponse.fromJson(response.data));
          }
        } else {
          // Return error response from json
          onError(ErrorResponse.fromJson(response.data));
        }
      },
      onError: (error) {
        if (error is dio.DioError) {
          if (error.response != null) {
            // Return error response from json
            onError(ErrorResponse.fromJson(error.response!.data));
          }
        } else {
          // Return error response manual
          onError(
            ErrorResponse(
              message: error.type.toString(),
              success: false,
            ),
          );
        }
      },
    );
  }

  void changePasswordUser({
    required ChangePasswordRequest data,
    required Function(SuccessResponse response) onSuccess,
    required Function(ErrorResponse error) onError,
    Function()? beforeSend,
  }) {
    if (beforeSend != null) {
      beforeSend();
    }

    _service.post(
      url: baseUrl + changePassword,
      data: data.toJson(),
      onSuccess: (response) {
        if (response is dio.Response) {
          if (response.statusCode == 200) {
            // Return data
            onSuccess(SuccessResponse.fromJson(response.data));
          }
        } else {
          // Return error response from json
          onError(ErrorResponse.fromJson(response.data));
        }
      },
      onError: (error) {
        if (error is dio.DioError) {
          if (error.response != null) {
            // Return error response from json
            onError(ErrorResponse.fromJson(error.response!.data));
          }
        } else {
          // Return error response manual
          onError(
            ErrorResponse(
              message: error.type.toString(),
              success: false,
            ),
          );
        }
      },
    );
  }

  void getUser({
    required Function(UserResponse response) onSuccess,
    required Function(ErrorResponse error) onError,
    Function()? beforeSend,
  }) {
    if (beforeSend != null) {
      beforeSend();
    }

    _service.get(
      url: baseUrl + account,
      onSuccess: (response) {
        if (response is dio.Response) {
          if (response.statusCode == 200) {
            // Return data
            onSuccess(UserResponse.fromJson(response.data));
          }
        } else {
          // Return error response from json
          onError(ErrorResponse.fromJson(response.data));
        }
      },
      onError: (error) {
        if (error is dio.DioError) {
          if (error.response != null) {
            // Return error response from json
            onError(ErrorResponse.fromJson(error.response!.data));
          }
        } else {
          // Return error response manual
          onError(
            ErrorResponse(
              message: error.toString(),
              success: false,
            ),
          );
        }
      },
    );
  }

  void deleteUser({
    required Function(SuccessResponse response) onSuccess,
    required Function(ErrorResponse error) onError,
    Function()? beforeSend,
  }) {
    if (beforeSend != null) {
      beforeSend();
    }

    _service.get(
      url: baseUrl + deleteAccount,
      onSuccess: (response) {
        if (response is dio.Response) {
          if (response.statusCode == 200) {
            // Return data
            onSuccess(SuccessResponse.fromJson(response.data));
          }
        } else {
          // Return error response from json
          onError(ErrorResponse.fromJson(response.data));
        }
      },
      onError: (error) {
        if (error is dio.DioError) {
          if (error.response != null) {
            // Return error response from json
            onError(ErrorResponse.fromJson(error.response!.data));
          }
        } else {
          // Return error response manual
          onError(
            ErrorResponse(
              message: error.toString(),
              success: false,
            ),
          );
        }
      },
    );
  }
}
