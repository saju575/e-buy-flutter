import 'dart:convert';

import 'package:e_buy/core/services/local_storage/shared_pref_service.dart';
import 'package:e_buy/core/services/network/network_client_service.dart';

import 'package:e_buy/features/auth/data/models/user_dto.dart';

class AuthDataSource {
  final SharedPrefService sharedPrefService;
  final NetworkClientService networkClientService;
  final String _tokenKey;
  final String _userKey;

  AuthDataSource({
    required this.networkClientService,
    required this.sharedPrefService,
    required String tokenKey,
    required String userKey,
  }) : _tokenKey = tokenKey,
       _userKey = userKey;

  UserDto? getUserData() {
    final userResponseData = sharedPrefService.getString(_userKey);
    if (userResponseData != null) {
      final userDto = UserDto.fromJson(jsonDecode(userResponseData));
      return userDto;
    }
    return null;
  }

  String getToken() {
    return sharedPrefService.getString(_tokenKey) ?? '';
  }
}
