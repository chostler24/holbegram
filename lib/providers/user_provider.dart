import 'package:flutter/foundation.dart';
import 'package:holbegram/services/auth_method.dart';
import 'package:holbegram/models/user.dart';

class UserProvider with ChangeNotifier {
    User _user;
    AuthMethod _authMethod = AuthMethod();

    User get user => _user;

    Future<void> refreshUser() async {
        User user = await _authMethod.getUserDetails();
        _user = user;
        notifyListeners();
    }
}
