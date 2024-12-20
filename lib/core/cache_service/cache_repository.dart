import '../enums/cache_paths.dart';

abstract class CacheRepository {
  Future<void> clearAll();

  Future<void> clearKey({
    required final CachePaths key,
  });

  Future<void> saveString({
    required final CachePaths key,
    required final String value,
  });

  Future<void> saveBoolean({
    required final CachePaths key,
    required final bool value,
  });

  Future<String?> getString({
    required final CachePaths key,
  });

  Future<bool?> getBoolean({
    required final CachePaths key,
  });

  Future<void> saveObject<T>({
    required final CachePaths key,
    required final T? object,
    required Map<String, dynamic> Function(T?) toJson,
  });

  Future<T?> getObject<T>({
    required final CachePaths key,
    required T Function(Map<String, dynamic>) fromJson,
  });

  Future<void> saveDateTime({
    required CachePaths key,
    required DateTime dateTime,
  });

  Future<DateTime?> getDateTime({
    required CachePaths key,
  });
}
