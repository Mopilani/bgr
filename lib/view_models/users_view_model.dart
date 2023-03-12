import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/user_error.dart';
import 'package:flutter_application_2/models/users_list_model.dart';
import 'package:flutter_application_2/repo/api_status.dart';
import 'package:flutter_application_2/repo/user_services.dart';

class UsersViewModel extends ChangeNotifier {
  bool _loading = false;
  List<UsersListModel> _usersListModel = [];
  bool get loading => _loading;
  UsersError? get usersError => _usersError;
  List<UsersListModel> get usersListModel => _usersListModel;
  UsersError? _usersError;

  UserViewModel() {
    getUsers();
  }

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setUsersListModel(List<UsersListModel> usersListModel) {
    _usersListModel = usersListModel;
  }

  setUsersError(UsersError userError) {
    _usersError = userError;
  }

  getUsers() async {
    setLoading(true);
    var response = await UserServices.getUsers();
    if (response is Success) {
      setUsersListModel(response.response as List<UsersListModel>);
    }
    if (response is Failure) {
      UsersError usersError = UsersError(
        response.code,
        response.errorResponse,
      );
      setUsersError(usersError);
    }
    setLoading(false);
  }
}
