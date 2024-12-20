import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:testcase/core/cache_service/cache_repository.dart';

import '../enums/cache_paths.dart';

class CacheService implements CacheRepository {
  static final CacheService _instance = CacheService._internal();
  CacheService._internal();
  static CacheService get instance => _instance;

  @override
  Future<void> clearAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  @override
  Future<void> clearKey({required final CachePaths key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key.name);
  }

  @override
  Future<void> saveString(
      {required final CachePaths key, required final String value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key.name, value);
  }

  @override
  Future<void> saveBoolean(
      {required final CachePaths key, required final bool value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key.name, value);
  }

  @override
  Future<String?> getString({required final CachePaths key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key.name);
  }

  @override
  Future<bool?> getBoolean({required final CachePaths key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key.name);
  }

  @override
  Future<void> saveObject<T>({
    required final CachePaths key,
    required final T? object,
    required Map<String, dynamic> Function(T?) toJson,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Nesneyi JSON'a dönüştür
    String jsonString = jsonEncode(toJson(object));
    await prefs.setString(key.name, jsonString);
  }

  @override
  Future<T?> getObject<T>({
    required final CachePaths key,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString(key.name);

    if (jsonString == null) {
      return null;
    }

    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    return fromJson(jsonMap);
  }

  @override
  Future<void> saveDateTime({
    required CachePaths key,
    required DateTime dateTime,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String dateTimeString = dateTime.toIso8601String();
    await prefs.setString(key.name, dateTimeString);
  }

  @override
  Future<DateTime?> getDateTime({
    required CachePaths key,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? dateTimeString = prefs.getString(key.name);
    if (dateTimeString == null) {
      return null;
    }
    return DateTime.parse(dateTimeString);
  }
}
