import 'dart:convert';

import 'package:clean_arch/Core/databases/cache/cache_helper.dart';
import 'package:clean_arch/Core/errors/expentions.dart';
import 'package:clean_arch/features/user/data/models/user_model.dart';

class UserLocalDatasource {
  final CacheHelper cache;
  final String key;

  UserLocalDatasource(this.key, {required this.cache});

  cacheUser(UserModel? userToCache) {
    if (userToCache != null) {
      cache.saveData(key: key, value: json.encode(userToCache.tojson()));
    } else {
      throw CacheExeption(errorMessage: "No Internet Connection");
    }
  }

  Future<UserModel> getLastUser() {
    final jsonString = cache.getDataString(key: key);
    if (jsonString != null) {
      return Future.value(UserModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheExeption(errorMessage: "No Internet Connection");
    }
  }
}
