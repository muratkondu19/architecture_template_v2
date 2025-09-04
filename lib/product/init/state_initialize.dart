import 'package:architecture_template/product/state/container/product_state_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Global state yönetimi için wrapper widget
/// Bu widget, uygulama genelinde kullanılacak state provider'ları sağlar
/// MultiBlocProvider ile birden fazla state provider'ı tek seferde sağlar
class StateInitialize extends StatelessWidget {
  const StateInitialize({required this.child, super.key});

  /// Alt widget - state provider'ların sağlanacağı widget ağacı
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // ProductViewModel'i global olarak sağla
        // Bu sayede tüm uygulama genelinde ProductViewModel'e erişilebilir
        BlocProvider.value(value: ProductStateItems.productViewModel),
      ],
      child: child,
    );
  }
}
