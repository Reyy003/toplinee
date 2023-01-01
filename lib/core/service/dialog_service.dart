part of 'services.dart';

class DialogService {
  Function(String)? _showDialogListener;

  Function? _showLoadingListener;
  Function? _hideLoadingListener;

  Completer? _dialogCompleter;

  void registerDialogListener(Function(String) showDialogListener,
      Function showLoadingListener, Function hideLoadingListener) {
    _showDialogListener = showDialogListener;
    _showLoadingListener = showLoadingListener;
    _hideLoadingListener = hideLoadingListener;
  }

  Future showLoading() {
    _dialogCompleter = Completer();
    if (_showLoadingListener != null) {
      _showLoadingListener!();
    }

    return _dialogCompleter!.future;
  }

  void hideLoading() {
    _hideLoadingListener!();
    if (_showLoadingListener != null) {
      _dialogCompleter!.complete();
      _dialogCompleter = null;
    }
  }

  Future showErrorDialog(String message) {
    _dialogCompleter = Completer();
    if (_showDialogListener != null) {
      _showDialogListener!(message);
    }

    return _dialogCompleter!.future;
  }

  void dialogComplete() {
    if (_dialogCompleter != null) {
      _dialogCompleter!.complete();
      _dialogCompleter = null;
    }
  }
}
