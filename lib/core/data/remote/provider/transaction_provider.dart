part of 'providers.dart';

class TransactionProvider {
  late ApiRequestService _service;

  TransactionProvider() {
    // Inject API Request service
    _service = Get.find<ApiRequestService>();
  }

  void createTopUp({
    required TopUpRequest data,
    required Function(SuccessResponse response) onSuccess,
    required Function(ErrorResponse error) onError,
    Function()? beforeSend,
  }) {
    if (beforeSend != null) {
      beforeSend();
    }

    _service.post(
      url: baseUrl + topUp,
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

  void getTransactions({
    required Function(TransactionResponse response) onSuccess,
    required Function(ErrorResponse error) onError,
    Function()? beforeSend,
  }) {
    if (beforeSend != null) {
      beforeSend();
    }

    _service.get(
      url: baseUrl + transactions,
      onSuccess: (response) {
        if (response is dio.Response) {
          if (response.statusCode == 200) {
            // Return data
            onSuccess(TransactionResponse.fromJson(response.data));
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
