import 'package:flutter/cupertino.dart';
import 'package:translate/services/status.dart';

class BaseProvider extends ChangeNotifier {
  Status _currentStatus = Status.idle;

  Status get currentStatus => _currentStatus;

  void setStatus(Status status) {
    _currentStatus = status;
    print('provider');
    notifyListeners();
  }
}
