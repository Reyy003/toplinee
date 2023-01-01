part of 'providers.dart';

class BasicProvider {
  late ApiRequestService _service;

  BasicProvider() {
    // Inject API Request service
    _service = Get.find<ApiRequestService>();
  }

  void getPayments({
    required Function(PaymentResponse response) onSuccess,
    required Function(ErrorResponse error) onError,
    Function()? beforeSend,
  }) {
    if (beforeSend != null) {
      beforeSend();
    }

    _service.get(
      url: baseUrl + payments,
      onSuccess: (response) {
        if (response is dio.Response) {
          if (response.statusCode == 200) {
            // Return data
            onSuccess(PaymentResponse.fromJson(response.data));
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

  void getGames({
    required Function(GameResponse response) onSuccess,
    required Function(ErrorResponse error) onError,
    Function()? beforeSend,
  }) {
    if (beforeSend != null) {
      beforeSend();
    }

    _service.get(
      url: baseUrl + games,
      onSuccess: (response) {
        if (response is dio.Response) {
          if (response.statusCode == 200) {
            // Return data
            onSuccess(GameResponse.fromJson(response.data));
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

  void getNominals({
    required String gameId,
    required Function(NominalResponse response) onSuccess,
    required Function(ErrorResponse error) onError,
    Function()? beforeSend,
  }) {
    if (beforeSend != null) {
      beforeSend();
    }

    _service.get(
      url: baseUrl + nominal,
      queryParameters: {"id": gameId},
      onSuccess: (response) {
        if (response is dio.Response) {
          if (response.statusCode == 200) {
            // Return data
            onSuccess(NominalResponse.fromJson(response.data));
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
