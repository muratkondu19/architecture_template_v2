import 'package:architecture_template/product/service/manager/product_service_manager.dart';
import 'package:architecture_template/product/state/container/product_state_items.dart';
import 'package:architecture_template/product/state/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Tüm stateful widget'lar için base sınıf
/// Bu sınıf, ortak kullanılan state yönetimi ve network işlemleri için getter'lar sağlar
/// Tüm stateful widget'lar bu sınıftan türetilerek ortak fonksiyonlara erişim sağlar
abstract class BaseState<T extends StatefulWidget> extends State<T> {
  /// Network manager'a erişim sağlayan getter
  /// ProductStateItems üzerinden singleton network manager instance'ına erişir
  /// HTTP istekleri için merkezi network yönetimi sağlar
  ProductNetworkManager get networkManager => ProductStateItems.networkManager;

  /// Product view model'a erişim sağlayan getter
  /// Context üzerinden ProductViewModel'e erişir
  /// Global state yönetimi için merkezi view model erişimi sağlar
  ProductViewModel get productViewModel => context.read<ProductViewModel>();
}
