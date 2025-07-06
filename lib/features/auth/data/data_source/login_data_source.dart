import 'dart:convert';
import 'package:e_buy/app/models/either.dart';

import 'package:e_buy/app/routes/api_urls.dart';
import 'package:e_buy/core/services/local_storage/shared_pref_service.dart';
import 'package:e_buy/core/services/network/network_client_service.dart';
import 'package:e_buy/features/auth/data/models/login_request_dto.dart';
import 'package:e_buy/features/auth/data/models/user_dto.dart';

class LoginDataSource {
  final SharedPrefService _sharedPrefService;
  final NetworkClientService _networkClientService;
  final String _tokenKey;
  final String _userKey;

  LoginDataSource({
    required SharedPrefService sharedPrefService,
    required NetworkClientService networkClientService,
    required String tokenKey,
    required String userKey,
  }) : _sharedPrefService = sharedPrefService,
       _networkClientService = networkClientService,
       _tokenKey = tokenKey,
       _userKey = userKey;

  Future<void> clearUserData() async {
    await _sharedPrefService.remove(_tokenKey);
    await _sharedPrefService.remove(_userKey);
  }

  Future<Either<Failure, UserDto>> login(
    LoginRequestDto loginRequestDto,
  ) async {
    final response = await _networkClientService.post(
      ApiUrls.login,
      loginRequestDto.toJson(),
    );
    if (response.isSuccess) {
      final userResponseData = response.data!["data"]["user"];

      final userDto = UserDto.fromJson(userResponseData);
      await _sharedPrefService.setString(
        _userKey,
        jsonEncode(userDto.toJson()),
      );
      await _sharedPrefService.setString(
        _tokenKey,
        response.data!["data"]["token"],
      );

      return Right(userDto);
    } else {
      return Left(
        Failure(
          message: response.errorMessage ?? "",
          code: response.statusCode,
        ),
      );
    }
  }
}
