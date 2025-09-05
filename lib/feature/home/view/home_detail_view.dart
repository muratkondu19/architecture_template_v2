import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
/// HomeDetailView widget'ının state sınıfı
final class HomeDetailView extends StatelessWidget {
  /// Constructor - id parametresi zorunlu, key parametresi opsiyonel
  const HomeDetailView({required this.id, super.key});

  /// id parametresi
  final String id;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
