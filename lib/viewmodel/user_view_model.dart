import 'dart:math';

import 'package:Placelook/domain/usecase/add_user_usecase.dart';
import 'package:Placelook/domain/usecase/get_profiles_usecase.dart';
import 'package:Placelook/domain/usecase/load_profile_usecase.dart';
import 'package:Placelook/domain/usecase/login_usecase.dart';
import 'package:Placelook/domain/usecase/save_profile_usecase.dart';
import 'package:Placelook/model/auth_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import '../model/profile.dart';
import '../model/user.dart';

class UserViewModel extends ChangeNotifier {
  Profile? _profile;
  AuthState state = AuthState.NONE;
  User _user = User();
  late final LoginUseCase _loginUseCase = GetIt.instance<LoginUseCase>();
  late final GetProfilesUseCase _getProfilesUseCase =
      GetIt.instance<GetProfilesUseCase>();
  late final LoadProfileUseCase _loadProfileUseCase =
      GetIt.instance<LoadProfileUseCase>();
  late final SaveProfileUsecase _saveProfileUsecase =
      GetIt.instance<SaveProfileUsecase>();
  late final AddUserUsecase _addUserUsecase = GetIt.instance<AddUserUsecase>();

  Profile? get profile => _profile;
  set profile(Profile? value) => (_profile = value);
  String get login => _user.login ?? "";
  String get password => _user.password ?? "";
  String get token => _user.token ?? "";
  set login(String value) => _user.login = value;
  set password(String value) => _user.password = value;
  set token(String? value) => _user.token = value;

  String get firstName => (profile != null) ? profile?.firstName ?? "" : "";
  String get lastName => (profile != null) ? profile?.lastName ?? "" : "";
  String get email => (profile != null) ? profile?.email ?? "" ?? "" : "";

  UserViewModel();

  Future _loginAsync() async {
    profile = null;
    if (_user.login != null &&
        _user.password != null &&
        _user.login.isNotEmpty &&
        _user.password.isNotEmpty) {
      //var t = await _loginUseCase.load(ParamLogin(_login!, _password!));
      var t = await _loginUseCase.load(ParamLogin(_user.login, _user.password));
      token = t;
    } else {
      token = null;
    }
  }

  Future _getUserByTokenAsync() async {
    if (_user.token != null && _user.token!.isNotEmpty) {
      List<Profile?>? profiles = await _getProfilesUseCase.load();
      print("All users");
      if (profiles != null) {
        for (var value in profiles) {
          if (value?.id == null) value?.generateID();
          print(value?.toString());
        }
        var rand = Random().nextInt(profiles.length - 1);
        profile = profiles[rand];
        print(profile.toString());
      } else {
        profile = null;
      }
    } else {
      profile = null;
    }
  }

  Future startApp() async {
    await _loginAsync();
    if (token.isNotEmpty) {
      await _getUserByTokenAsync();
    } else {
      print("Login error");
    }
  }

  void fromStorage() {
    _loadProfileUseCase.load().then((Profile? u) => {
          if (u != null) {profile = u, notifyListeners()}
        });
  }

  void save() {
    if (profile != null) {
      _saveProfileUsecase.load(profile!);
    }
  }

  Future<Profile?> getUserByID(String id) async {
    List<Profile?>? list = await _getProfilesUseCase.load();
    Profile? u = null;
    if (list != null) {
      u = list.where((food) => food?.id == id).first;
    }
    return u;
  }

  void addUser(User u, callback(User? newUser)) async {
    var uu = await _addUserUsecase.load(u);
    if (uu != null) {
      _user = uu;
    }
    callback(uu);
  }
}
