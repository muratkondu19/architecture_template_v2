import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';

import 'core/hive_common_test.dart';
import 'user_cache.dart';

void main() {
  setUp(() async {
    await initTests();
    final coreManager = HiveCacheManager(
      path: 'test/hive',
    );
    await coreManager.init(
      cacheModels: [
        UserCache.empty(),
      ],
    );
  });

  test('Add a data for database', () {
    final userOperation = HiveCacheOperation<UserCache>();

    userOperation.add(UserCache(id: '1', name: 'vb'));
    final item = userOperation.get('1');
    expect(item, isNotNull);
  });
}
