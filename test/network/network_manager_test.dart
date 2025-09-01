import 'dart:io';

import 'package:architecture_template/product/init/config/app_enviroment.dart';
import 'package:architecture_template/product/service/manager/product_service_manager.dart';
import 'package:architecture_template/product/service/manager/service_path.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gen/gen.dart';
import 'package:vexana/vexana.dart';

void main() {
  late final ProductNetworkManager manager;
  setUp(() {
    AppEnvironment.general();
    manager = ProductNetworkManager();
  });
  test('get users items from api', () async {
    final response = await manager.send<User, List<User>>(
      ServicePath.users.fullPath,
      parseModel: const User(),
      method: RequestType.GET,
    );

    expect(response.data, isNotNull);
  });

  test('get users items from api with error', () async {
    manager.listenErorState(
      onErrorStatus: (value) {
        if (value == HttpStatus.unauthorized) {}
        expect(value, isNotNull);
      },
    );
    final response = await manager.send<User, List<User>>(
      ServicePath.users.fullPath,
      parseModel: const User(),
      method: RequestType.GET,
    );

    expect(response.data, null);
  });
}
